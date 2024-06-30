--------------------------
-- NeoVim/VSCode Shared --
--------------------------

local set = vim.opt
local keymap = vim.keymap.set
local wo = vim.wo
local g = vim.g

-- Basic -- 
g.mapleader = " "
set.clipboard = "unnamedplus"
set.smartcase = true
set.ignorecase = true
wo.relativenumber = true
wo.number = true

-- Keymaps --
keymap("n", "<Esc>", "<CMD>nohl<CR><Esc>", {silent = true})
keymap('n', '<leader>w', "<CMD>:update<CR>", {silent = true})

keymap({"n", "v"}, "H", "^", {silent = true})
keymap({"n", "v"}, "L", "$", {silent = true})

keymap('v', '<', '< gv', {silent = true})
keymap('v', '>', '> gv', {silent = true})

keymap("n", "U", "<CMD>earlier<CR>", {silent = true})
keymap("n", "R", "<CMD>later<CR>", {silent = true})

-- Remap delete --
keymap({"n", "v"}, "d", '"_d')
keymap({"n", "v"}, "s", "d")
keymap({"n", "v"}, "c", '"_c')
keymap("v", "p", '"_dP')

keymap("n", "D", '"_D')
keymap("n", "S", "D")
keymap("n", "C", '"_C')

keymap("n", "x", '"_x')
keymap("n", "ss", "dd")


-- Highlights --
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=100})
  augroup END
]]

