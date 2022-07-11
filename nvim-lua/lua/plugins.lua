local opts = { noremap = true, silent = true }

-- Telescope
vim.api.nvim_set_keymap("n", "<c-p>", "<CMD>lua require'telescope-config'.project_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", "<CMD>lua require'telescope-config'.help_tags()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-e>", "<CMD>lua require'telescope-config'.find_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-b>", "<CMD>lua require'telescope-config'.buffers()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-c>", "<CMD>lua require'telescope-config'.live_grep()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cd", "<CMD>lua require'telescope-config'.dotfiles()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cc", "<CMD>lua require'telescope-config'.vim_config()<CR>", opts)

-- QF Helper
vim.api.nvim_set_keymap("n", "<leader>;", "<CMD>QNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>,", "<CMD>QPrev<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>k", "<CMD>QFToggle!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>LLToggle!<CR>", opts)


-- Neogit
vim.api.nvim_set_keymap("n", "<leader>j", "<CMD>Neogit<CR>", opts)


-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", opts)


-- Ranger
vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>Ranger<CR>", opts)


-- TMUX Navigator
vim.api.nvim_set_keymap("n", "<A-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-l>", "<CMD>TmuxNavigateRight<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<CMD>TmuxNavigateUp<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-j>", "<CMD>TmuxNavigateDown<CR>", opts)

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

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gj', vim.diagnostic.goto_prev, bufnr)
    vim.keymap.set('n', 'gk', vim.diagnostic.goto_next, bufnr)

    vim.keymap.set('n', 'gh', vim.diagnostic.open_float, bufnr)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>q', vim.lsp.buf.formatting, bufopts)
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

require("clangd_extensions").setup()
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
