local opts = { noremap = true, silent = true }

-- QF Helper
vim.api.nvim_set_keymap("n", "<leader>;", "<CMD>QNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>,", "<CMD>QPrev<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>k", "<CMD>QFToggle!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>LLToggle!<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>n", "<CMD>Gitsigns next_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", "<CMD>Gitsigns prev_hunk<CR>", opts)

-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", opts)


-- Ranger
vim.api.nvim_set_keymap("n", "<leader>r", "<CMD>Ranger<CR>", opts)

-- LazyGit
-- vim.keymap.set('n', '<leader>j', "<CMD>LazyGit<CR>", opts)


-- TMUX Navigator
vim.api.nvim_set_keymap("n", "<A-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-l>", "<CMD>TmuxNavigateRight<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<CMD>TmuxNavigateUp<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-j>", "<CMD>TmuxNavigateDown<CR>", opts)

-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr= require'treesitter'nvim_treesitter#foldexpr()
