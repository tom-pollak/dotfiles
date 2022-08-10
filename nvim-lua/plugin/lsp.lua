vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
    }
})
-- Keymaps
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    client.offset_encoding = "utf-8"
    require 'nvim-navic'.attach(client, bufnr)
    -- require 'virtualtypes'.on_attach(client, bufnr)
    require 'lsp_signature'.on_attach({
        bind = true
    })


    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>f', telescope_builtin.lsp_workspace_symbols, bufopts)
    vim.keymap.set('n', '<leader>s', telescope_builtin.lsp_document_symbols, bufopts)
    vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, bufopts)
    vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, bufopts)
    vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', 'gt', telescope_builtin.lsp_type_definitions, bufopts)

    local diagnostic = require("lspsaga.diagnostic")

    vim.keymap.set("n", "<leader>t", vim.lsp.diagnostic.set_loclist, bufopts)

    vim.keymap.set("n", "gk", function()
        diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "gj", function()
        diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "gK", function()
        diagnostic.goto_prev({ severity = vim.diagnostic.severity.ANY })
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "gJ", function()
        diagnostic.goto_next({ severity = vim.diagnostic.severity.ANY })
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "gh", diagnostic.show_line_diagnostics, { silent = true, noremap = true })

    -- show hover doc and press twice will jumpto hover window
    vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })

    -- vim.keymap.set('n', '<leader>t', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gs", require("lspsaga.signaturehelp").signature_help, { silent = true, noremap = true })


    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>rn", require("lspsaga.rename").lsp_rename, { silent = true, noremap = true })

    vim.keymap.set("n", "ga", require("lspsaga.codeaction").code_action, { silent = true, noremap = true })
    -- vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set("v", "ga", function()
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    --     action.range_code_action()
    -- end, { silent = true, noremap = true })

    vim.keymap.set('n', '<leader>q', vim.lsp.buf.formatting, bufopts)

    vim.keymap.set("n", "gp", require("lspsaga.definition").preview_definition, { silent = true, noremap = true })

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

--------------------------------------------------------------------------------

local capabilities = {
    require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- offsetEncoding = 'utf-8',
}
-- local root_dir = require 'nvim_lsp'.util.root_pattern('.git')

-- LSP servers
local lspconfig = require('lspconfig')
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
    -- root_dir = root_dir,
    capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    -- root_dir = root_dir,
    capabilities = capabilities,
    -- settings = {
    --     checkOnSave = {
    --         command = "clippy"
    --     }
    -- }
}

lspconfig.pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                -- pycodestyle = {
                --     enabled = true,
                --     ignore = "warnings"
                -- },
                -- pyflakes = { enabled = true },
                pylint = { enabled = true },
                flake8 = {
                    enabled = true,
                    maxLineLength = 88
                },
                yapf = {
                    enabled = false,
                },
                black = {
                    enabled = true,
                },
            },
        },
    },
    -- root_dir = root_dir,
    capabilities = capabilities,
}

lspconfig.clangd.setup {
    on_attach = on_attach,
    -- root_dir = root_dir,
    capabilities = capabilities
}
