local opts = {noremap = true, silent = true}

-- Change windows
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>")

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>TroubleToggle<cr>", opts)

-- Keep selection after indenting
vim.keymap.set("v", "<", "<gv", {silent = true})
vim.keymap.set("v", ">", ">gv", {silent = true})

-- nvim tree
-- vim.keymap.set({"n", "x"}, "<leader>e", "<CMD>NvimTreeToggle<CR>", opts)

-- Gitmessenger
vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>GitMessenger<cr>", opts)

-- Smooth scroll
vim.keymap.set('n', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('n', '<ScrollWheelDown>', '<C-e>')
vim.keymap.set('i', '<ScrollWheelUp>', '<C-o><C-y>')
vim.keymap.set('i', '<ScrollWheelDown>', '<C-o><C-e>')
vim.keymap.set('v', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('v', '<ScrollWheelDown>', '<C-e>')
