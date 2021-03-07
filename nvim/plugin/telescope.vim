lua require("lua-files")

silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
    nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
else
    nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
endif

nnoremap <C-b> :lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pd :lua require('lua-files.telescope').search_dotfiles()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>gc :lua require('lua-files.telescope').git_branches()<CR>
