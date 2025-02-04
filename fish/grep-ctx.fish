function grep-ctx -d "Generate repository context with grep-like pattern matching"
    # Show help if requested
    if contains -- -h $argv; or contains -- --help $argv
        echo "Usage: grep-ctx [PATTERN...] [PATH]"
        echo
        echo "Generate repository context with grep-like pattern matching"
        echo
        echo "Examples:"
        echo "  grep-ctx                   # Use current directory and match all files"
        echo "  grep-ctx \"*.py\"           # Match Python files in current directory"
        echo "  grep-ctx \"*.py\" ./src     # Match Python files in ./src"
        echo "  grep-ctx \"*.py\" \"*.js\" .  # Match Python and JavaScript files"
        return 0
    end

    # use CWD and * by default
    if test (count $argv) -eq 0
        set path "."
        set glob "*"
    else if test (count $argv) -eq 1
        # First arguments are pattern
        set path "."
        set glob $argv[1]
    else
        # Last argument is path
        set path $argv[-1]
        set glob $argv[1..-2]
        string join " " $glob > /dev/null # Convert array to space-separated string
    end

    set python_script '
from toolslm.xml import *
patterns = "'$glob'".split()
print(folder2ctx(
    folder="'$path'",
    prefix=False,
    file_glob=patterns
))
'
    uv run --with toolslm python -c "$python_script"
end
