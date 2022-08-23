vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
    }
})
require('nvim-lsp-installer')
-- Keymaps
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

--------------------------------------------------------------------------------
local on_attach = require'plugins.lsp-attach'.on_attach

local capabilities = {
    require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- offsetEncoding = 'utf-8',
}
-- local root_dir = require 'nvim_lsp'.util.root_pattern('.git')

local lspconfig = require('lspconfig')

local root_dir = function(fname)
    return lspconfig.util.find_git_ancestor(fname)
        or vim.fn.getcwd()
end

-- LSP servers
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'use' },
            },
        },
    },
    root_dir = root_dir,
    capabilities = capabilities
}
-- Done by rust-tools
--[[ lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    -- settings = {
    --     checkOnSave = {
    --         command = "clippy"
    --     }
    -- }
} ]]

lspconfig.pyright.setup {
    on_attach = on_attach,
    -- root_dir = root_dir,
    capabilities = capabilities
}

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    rootdir = function(fname)
        return lspconfig.util.root_pattern('compile_commands.json') or root_dir(fname)
    end
}
