vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
    }
})

local on_attach = require'extensions.lsp-attach'.on_attach

local capabilities = {
    require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

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
