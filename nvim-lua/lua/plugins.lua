-- Plugin specific mappings

local opts = { noremap=true, silent=true }

-- Telescope

vim.api.nvim_set_keymap("n", "<c-p>", "<CMD>lua require'telescope-config'.project_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", "<CMD>lua require'telescope-config'.help_tags()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-g>", "<CMD>lua require'telescope-config'.find_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-b>", "<CMD>lua require'telescope-config'.buffers()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-c>", "<CMD>lua require'telescope-config'.live_grep()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cd", "<CMD>lua require'telescope-config'.dotfiles()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cc", "<CMD>lua require'telescope-config'.vim_config()<CR>", opts)

-- " use <C-N> and <C-P> for next/prev.
-- nnoremap <silent> <C-N> <cmd>QNext<CR>
-- nnoremap <silent> <C-P> <cmd>QPrev<CR>
-- " toggle the quickfix open/closed without jumping to it
-- nnoremap <silent> <leader>q <cmd>QFToggle!<CR>
-- nnoremap <silent> <leader>l <cmd>LLToggle!<CR>

-- vim.api.nvim_set_keymap("n", "<c-j>", "<CMD>QNext<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<c-k>", "<CMD>QPrev<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>k", "<CMD>QFToggle!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>LLToggle!<CR>", opts)


vim.api.nvim_set_keymap("n", "<leader>j", "<CMD>Neogit<CR>", opts)


-- Pear tree

vim.g.pear_tree_repeatable_expand = 0
vim.g.pear_tree_map_special_keys = 0


-- Nvim Tree

-- vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>lua require'tree-config'.toggle_replace()<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>Ranger<CR>", opts)


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
vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, opts)

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
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>q', vim.lsp.buf.formatting, bufopts)
end


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
}
lspconfig.rust_analyzer.setup {}
lspconfig.pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                -- pyflakes = {enabled = false},
                -- pylint = {enabled = false},
            },
        },
    },
}

require("clangd_extensions").setup()
lspconfig.clangd.setup{
    on_attach = on_attach,
}
