import os
from pathlib import Path
import logging
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import pathspec
from collections import defaultdict

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def parse_arguments():
    parser = argparse.ArgumentParser(description='Compile codebase into a markdown file.')
    parser.add_argument('--output', type=str, default="codebase.md", help='Output markdown file')
    parser.add_argument('--extensions', nargs='+', default=["md", "py", "js", "ts", "toml", "md"], help='File extensions to include')
    parser.add_argument('--folders', nargs='+', default=["."], help='Folders to search')
    parser.add_argument('--exclude_files', nargs='+', default=["concat_repo_files.py"], help='Files to exclude')
    parser.add_argument('--exclude_subfolders', nargs='+', default=["venv", "__pycache__", "node_modules"], help='Subfolders to exclude')
    parser.add_argument('--respect_gitignore', action='store_true', default=True, help='Respect .gitignore files')
    parser.add_argument('--include_hidden', action='store_true', help='Include hidden files and folders')
    return parser.parse_args()

def load_gitignore(folders):
    gitignore_patterns = []
    for folder in folders:
        gitignore_path = folder / ".gitignore"
        if gitignore_path.exists():
            with open(gitignore_path, "r") as gitignore_file:
                gitignore_patterns += gitignore_file.readlines()
    return pathspec.PathSpec.from_lines(pathspec.patterns.GitWildMatchPattern, gitignore_patterns)

def should_skip_folder(folder, base_folder, exclude_subfolders, spec, include_hidden):
    if not include_hidden and folder.name.startswith('.'):
        return True
    if any(exc_folder in folder.parts for exc_folder in exclude_subfolders):
        return True
    try:
        relative_path = folder.relative_to(base_folder)
        if spec and spec.match_file(str(relative_path)):
            return True
    except ValueError:
        return True
    return False

def should_process_file(filepath, base_folder, output_file, exclude_files, spec, extensions, include_hidden):
    path = Path(filepath).resolve()
    if not include_hidden and path.name.startswith('.'):
        return False
    if output_file:
        output_path = Path(output_file).resolve()
        if path == output_path:
            return False
    if path in exclude_files:
        return False
    if path.suffix[1:].lower() not in extensions:
        return False
    try:
        relative_path = path.relative_to(base_folder)
        if spec and spec.match_file(str(relative_path)):
            return False
    except ValueError:
        return False
    return True

def process_file(filepath, base_folder, output_file, extensions):
    try:
        filepath = Path(filepath)
        file_extension = filepath.suffix[1:].lower()

        if file_extension in extensions:
            logging.info(f"Processing file: {filepath}")
            with open(filepath, "r", encoding="utf-8") as in_f:
                content = in_f.read()

            with open(output_file, "a", encoding="utf-8") as out_f:
                out_f.write(f"## {filepath.relative_to(base_folder)}\n\n")
                out_f.write(f"~~~{file_extension}\n")
                out_f.write(content)
                out_f.write("\n~~~\n\n")
    except UnicodeDecodeError:
        logging.warning(f"Skipping binary file: {filepath}")
        with open(output_file, "a", encoding="utf-8") as out_f:
            out_f.write(f"## {filepath.relative_to(base_folder)}\n\n")
            out_f.write("[Binary file content not displayed]\n\n")
    except Exception as e:
        logging.error(f"Error processing file {filepath}: {e}")

def build_tree(folders, exclude_subfolders, spec, include_hidden):
    tree = defaultdict(list)
    for folder in folders:
        for root, dirs, files in os.walk(folder):
            path = Path(root)
            if not should_skip_folder(path, folder, exclude_subfolders, spec, include_hidden):
                tree[path].extend([f for f in files if include_hidden or not f.startswith('.')])
            dirs[:] = [d for d in dirs if not should_skip_folder(path / d, folder, exclude_subfolders, spec, include_hidden)]
    return tree

def print_tree(tree, output_file):
    with open(output_file, "a", encoding="utf-8") as out_f:
        out_f.write("# Folder Structure\n\n")
        out_f.write("~~~\n")
        sorted_folders = sorted(tree.keys())
        for i, folder in enumerate(sorted_folders):
            depth = len(folder.parts) - 1
            is_last = i == len(sorted_folders) - 1
            prefix = "    " * (depth - 1) + ("└── " if is_last else "├── ") if depth > 0 else ""
            out_f.write(f"{prefix}{folder.name}/\n")
            files = sorted(tree[folder])
            for j, file in enumerate(files):
                is_last_file = j == len(files) - 1
                file_prefix = "    " * depth + ("└── " if is_last_file else "├── ")
                out_f.write(f"{file_prefix}{file}\n")
        out_f.write("~~~\n\n")

def main():
    args = parse_arguments()

    if not args.folders:
        logging.error("At least one folder must be specified")
        exit(1)

    output_file = args.output
    extensions = [ext.lower() for ext in args.extensions]
    folders = [Path(folder).resolve() for folder in args.folders]
    exclude_files = [Path(file).resolve() for file in args.exclude_files]
    exclude_subfolders = args.exclude_subfolders
    include_hidden = args.include_hidden

    spec = load_gitignore(folders) if args.respect_gitignore else None

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("# Compiled Codebase\n\n")

    # Build and print the tree structure
    tree = build_tree(folders, exclude_subfolders, spec, include_hidden)
    print_tree(tree, output_file)

    with ThreadPoolExecutor(max_workers=4) as executor:
        futures = []
        for folder in folders:
            for root, dirs, files in os.walk(folder):
                path = Path(root)
                if should_skip_folder(path, folder, exclude_subfolders, spec, include_hidden):
                    continue
                for file in files:
                    filepath = path / file
                    if should_process_file(filepath, folder, output_file, exclude_files, spec, extensions, include_hidden):
                        futures.append(executor.submit(process_file, filepath, folder, output_file, extensions))

        for future in as_completed(futures):
            try:
                future.result()
            except Exception as e:
                logging.error(f"Unexpected error: {e}")

    logging.info(f"Codebase has been compiled into {output_file}")

if __name__ == "__main__":
    main()
