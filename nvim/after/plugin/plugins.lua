local opts = {noremap = true, silent = true}

vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>")

-- Quickfix
vim.api.nvim_set_keymap("n", "<leader>rk", "<cmd>QFToggle!<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>rl", "<cmd>LLToggle!<cr>",
                        {silent = true, noremap = true})

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>TroubleToggle<cr>",
                        {silent = true, noremap = true})

-- Context
vim.keymap.set({"n"}, "<leader>i", "<CMD>TSContextToggle<CR>", {silent = true})

-- LazyGit
vim.keymap.set("n", "<leader>j", "<CMD>LazyGit<CR>", opts)

vim.keymap.set("v", "<", "<gv", {silent = true})
vim.keymap.set("v", ">", ">gv", {silent = true})

-- Leap
vim.keymap.set({"n", "x", "o"}, ";", "<Plug>(leap-forward-to)")
vim.keymap.set({"n", "x", "o"}, ",", "<Plug>(leap-backward-to)")

-- nvim tree
vim.keymap.set({"n", "x"}, "<leader>e", "<CMD>NvimTreeToggle<CR>")

-- Formatter
vim.keymap.set({"n", "x"}, "<leader>q", "<CMD>Format<CR>")

-- Gitmessenger
vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>GitMessenger<cr>",
                        {noremap = true})

vim.keymap.set({'i', 'n'}, '<C-]>',
               function() require('lsp_signature').toggle_float_win() end,
               {silent = true, noremap = true, desc = 'toggle signature'})
