-- Keymaps
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings. (vim.lsp.*)

    client.offset_encoding = "utf-8"
    require 'nvim-navic'.attach(client, bufnr)
    require 'virtualtypes'.on_attach(client, bufnr)
    require 'lsp_signature'.on_attach({
        bind = true
    })
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gk", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ANY })
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "gj", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ANY })
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "gK", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "gJ", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "gh", require("lspsaga.diagnostic").show_line_diagnostics, { silent = true, noremap = true })

    -- show hover doc and press twice will jumpto hover window
    vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })

    local action = require("lspsaga.action")
    -- scroll down hover doc or scroll in definition preview
    --
    vim.keymap.set("n", "<c-.>", function()
        action.smart_scroll_with_saga(1)
    end, { silent = true })
    -- scroll up hover doc
    vim.keymap.set("n", "<c-,>", function()
        action.smart_scroll_with_saga(-1)
    end, { silent = true })


    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)

    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts) -- Send to quickfix
    vim.keymap.set("n", "gr", require("lspsaga.finder").lsp_finder, { silent = true, noremap = true })

    -- vim.keymap.set('n', '<leader>t', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gs", require("lspsaga.signaturehelp").signature_help, { silent = true, noremap = true })


    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>rn", require("lspsaga.rename").lsp_rename, { silent = true, noremap = true })

    vim.keymap.set("n", "ga", require("lspsaga.codeaction").code_action, { silent = true, noremap = true })
    -- vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set("n", "ga", action.code_action, { silent = true, noremap = true })
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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
    capabilities = capabilities
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
            },
            yapf = {
                enabled = false,
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
