-- require('cmp-config')
-- Plugin specific mappings

local opts = { noremap=true, silent=true }

-- Telescope
vim.api.nvim_set_keymap("n", "<c-p>", "<CMD>lua require'telescope-config'.project_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", "<CMD>lua require'telescope-config'.help_tags()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-e>", "<CMD>lua require'telescope-config'.find_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-b>", "<CMD>lua require'telescope-config'.buffers()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-c>", "<CMD>lua require'telescope-config'.live_grep()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cd", "<CMD>lua require'telescope-config'.dotfiles()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cc", "<CMD>lua require'telescope-config'.vim_config()<CR>", opts)

vim.api.nvim_set_keymap("n", "<c-;>", "<CMD>QNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-,>", "<CMD>QPrev<CR>", opts)
-- jump to the next item, skipping the groups
-- vim.api.nvim_set_keymap("n", "<c-;>", ':lua require("trouble").next({skip_groups = true, jump = true})<CR>', {silent=true})
-- vim.api.nvim_set_keymap("n", "<c-,>", ':lua require("trouble").previous({skip_groups = true, jump = true})<CR>', {silent=true})

vim.api.nvim_set_keymap("n", "<leader>k", "<CMD>QFToggle!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>LLToggle!<CR>", opts)


vim.api.nvim_set_keymap("n", "<leader>j", "<CMD>Neogit<CR>", opts)

-- Pear tree

vim.g.pear_tree_repeatable_expand = 0
vim.g.pear_tree_map_special_keys = 0


-- Nvim Tree

-- vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>lua require'tree-config'.toggle_replace()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>Ranger<CR>", opts)
vim.g.ranger_replace_netrw = 1


-- Treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = { -- dosen't work
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
  },
  context_commentstring = {
      enable = true
  }
}


-- LSP
-- Keymaps
vim.keymap.set('n', 'gh', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gj', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gk', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
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
                globals = {'vim', 'use'},
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
lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}


-- Trouble
--
-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
--   {silent = true, noremap = true}
-- )
