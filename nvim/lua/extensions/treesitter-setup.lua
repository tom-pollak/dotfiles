require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"phpdoc"},
    sync_install = false,
    highlight = {enable = true},
    indent = {enable = true},
    rainbow = {enable = true, extended_mode = true, max_file_lines = nil},
    context_commentstring = {enable = true, enable_autocmd = false}
}

require'treesitter-context'.setup {
    enable = true,
    patterns = {rust = {'impl_item', 'struct', 'enum', 'mod', 'match', 'loop'}}
}
