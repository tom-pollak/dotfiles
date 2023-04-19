local opts = {noremap = true, silent = true}

-- Change windows
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>")

-- Quickfix
vim.api.nvim_set_keymap("n", "<leader>rk", "<cmd>QFToggle!<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rl", "<cmd>LLToggle!<cr>", opts)

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>TroubleToggle<cr>", opts)

-- Context
vim.keymap.set({"n"}, "<leader>i", "<CMD>TSContextToggle<CR>", opts)

-- LazyGit
vim.keymap.set("n", "<leader>j", "<CMD>LazyGit<CR>", opts)

-- Keep selection after indenting
vim.keymap.set("v", "<", "<gv", {silent = true})
vim.keymap.set("v", ">", ">gv", {silent = true})

-- Leap
vim.keymap.set({"n", "x", "o"}, ";", "<Plug>(leap-forward-to)", opts)
vim.keymap.set({"n", "x", "o"}, ",", "<Plug>(leap-backward-to)", opts)

-- nvim tree
vim.keymap.set({"n", "x"}, "<leader>e", "<CMD>NvimTreeToggle<CR>", opts)

-- Formatter
vim.keymap.set({"n", "x"}, "<leader>q", function()
    vim.cmd("update")
    vim.cmd("Format")
end, opts)

-- Gitmessenger
vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>GitMessenger<cr>", opts)

-- Parameter hints
vim.keymap.set({'i', 'n'}, '<C-]>',
               function() require('lsp_signature').toggle_float_win() end, opts)

-- Smooth scroll
vim.keymap.set('n', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('n', '<ScrollWheelDown>', '<C-e>')
vim.keymap.set('i', '<ScrollWheelUp>', '<C-o><C-y>')
vim.keymap.set('i', '<ScrollWheelDown>', '<C-o><C-e>')
vim.keymap.set('v', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('v', '<ScrollWheelDown>', '<C-e>')

local function toggle_virtual_text()
    local vt = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({virtual_text = not vt})
end

vim.keymap.set('n', '<leader>u', toggle_virtual_text)
