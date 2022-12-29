local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
    "rust_analyzer",
    "sumneko_lua",
    "clangd",
    "pyright"
})

lsp.nvim_workspace()

lsp.set_preferences({
    set_lsp_keymaps = false
})
lsp.setup_nvim_cmp(require'extensions.cmp-setup'.cmp_setup)

lsp.on_attach(require 'extensions.lsp-attach'.on_attach)
lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
    }
})
