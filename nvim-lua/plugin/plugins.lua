local opts = { noremap = true, silent = true }

vim.keymap.set('c', '!!', function() return "AsyncRun " end, { expr = true })

-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", opts)


-- Ranger
-- vim.api.nvim_set_keymap("n", "<leader>r", "<CMD>Ranger<CR>", opts)


-- TMUX Navigator
vim.api.nvim_set_keymap("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", opts)

-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr= require'treesitter'nvim_treesitter#foldexpr()

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xk", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)

-- Gitmessenger
vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>GitMessenger<cr>",
    { noremap = true }
)

-- Copilot
vim.keymap.set("n", "<leader>gp", "<cmd>Copilot split<cr>")


-- Leap
local leap = require 'leap'
vim.keymap.set({ 'n', 'x', 'o' }, '<Tab>', function()
    leap.leap {}
end, { noremap = true })

vim.keymap.set({ 'n', 'x', 'o' }, '<S-Tab>', function()
    leap.leap { backward = true }
end, { noremap = true })

vim.keymap.set({ 'n', 'x', 'o' }, '"', function() require 'plugins.leap-ast'.leap() end, {})

-- Context
vim.keymap.set({ 'n' }, '<leader>i', "<CMD>TSContextToggle<CR>", { silent = true })

-- LazyGit
vim.keymap.set('n', '<leader>j', "<CMD>LazyGit<CR>", opts)

-- Telekasten
vim.keymap.set('n', '<leader>mm', "<CMD>Telekasten panel<CR>", opts)

vim.keymap.set('n', '<Esc>', '<CMD>nohl<CR><Esc><CMD>call clever_f#reset()<CR>', { silent = true })
