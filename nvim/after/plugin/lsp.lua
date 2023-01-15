local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
    "rust_analyzer",
    "sumneko_lua",
    "clangd",
    "pyright"
})

lsp.configure('pyright', {
    settings = {
        pyright = { autoImportCompletion = true, },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'basic',
                autoImportCompletion = true
            }
        }
    }
})

lsp.nvim_workspace()

lsp.set_preferences({ set_lsp_keymaps = false })
lsp.setup_nvim_cmp(require 'extensions.cmp-setup'.cmp_setup)
lsp.on_attach(require 'extensions.lsp-attach'.on_attach)

lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
    },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true, -- TODO: perhaps change to false
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },

})
