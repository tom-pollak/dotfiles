local on_attach = require'completion'.on_attach
require'lspconfig'.tsserver.setup{ on_attach=on_attach }

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.pyls_ms.setup{
    on_attach=on_attach,
    cmd = {"dotnet", "exec", "/opt/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll"},
    -- settings = {
        -- pyls = {
        --     plugins = {
        --         pycodestyle = {
        --             maxLineLength = 88
        --         },
        --         yapf = {
        --             enabled = false
        --             }
        --     }
        -- }
    -- },
}

-- require'lspconfig'.jedi_language_server.setup{}

require'lspconfig'.jdtls.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
