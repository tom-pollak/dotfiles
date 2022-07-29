local telescope_config = require 'telescope-config'
local opts = { noremap = true, silent = true }

-- Telescope
vim.keymap.set('n', '<c-p>', telescope_config.project_files, opts)
vim.keymap.set('n', '<leader>h', telescope_config.help_tags, opts)
vim.keymap.set('n', '<c-e>', telescope_config.find_files, opts)
vim.keymap.set('n', '<c-b>', telescope_config.buffers, opts)
vim.keymap.set('n', '<c-c>', telescope_config.live_grep, opts)

vim.keymap.set('n', '<leader>g', telescope_config.tags, opts)
vim.keymap.set('n', '<leader>f', telescope_config.current_buffer_tags, opts)

vim.keymap.set('n', '<leader>cd', telescope_config.dotfiles, opts)
vim.keymap.set('n', '<leader>cc', telescope_config.vim_config, opts)

vim.keymap.set('n', '<leader>m', telescope_config.marks, opts)

-- QF Helper
vim.api.nvim_set_keymap("n", "<leader>;", "<CMD>QNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>,", "<CMD>QPrev<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>k", "<CMD>QFToggle!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>LLToggle!<CR>", opts)

-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", opts)


-- Ranger
vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>Ranger<CR>", opts)

-- LazyGit
vim.keymap.set('n', '<leader>j', "<CMD>LazyGit<CR>", opts)


-- TMUX Navigator
vim.api.nvim_set_keymap("n", "<A-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-l>", "<CMD>TmuxNavigateRight<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<CMD>TmuxNavigateUp<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-j>", "<CMD>TmuxNavigateDown<CR>", opts)

-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr= require'treesitter'nvim_treesitter#foldexpr()
-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------

-- Keymaps
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings. (vim.lsp.*)

    require 'nvim-navic'.attach(client, bufnr)
    require 'virtualtypes'.on_attach(client, bufnr)
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

    vim.keymap.set("n", "ga", require("lspsaga.codeaction").code_action, { silent = true,noremap = true })
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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = "warnings"
                }
                -- pyflakes = {enabled = false},
                -- pylint = {enabled = false},
            },
        },
    },
    capabilities = capabilities
}

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
