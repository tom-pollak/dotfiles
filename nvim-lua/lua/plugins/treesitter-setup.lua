-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr=nvim_treesitter#foldexpr()
require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    rainbow = { -- dosen't work
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
}