--------------------------
-- NeoVim/VSCode Shared --
--------------------------

local set = vim.opt
local keymap = vim.keymap.set
local wo = vim.wo

vim.g.mapleader = ' '

set.clipboard = 'unnamedplus'
set.smartcase = true
set.ignorecase = true

wo.relativenumber = true
wo.number = true


-- Remap delete
keymap({"n", "v"}, "d", '"_d')
keymap({"n", "v"}, "s", "d")
keymap({"n", "v"}, "c", '"_c')
keymap("v", "p", '"_dP')

keymap("n", "D", '"_D')
keymap("n", "S", "D")
keymap("n", "C", '"_C')

keymap("n", "x", '"_x')
keymap("n", "ss", "dd")

-- Keymaps --
keymap("n", "<Esc>", "<CMD>nohl<CR><Esc>", {silent = true})

keymap({"n", "v"}, "H", "^", {silent = true})
keymap({"n", "v"}, "L", "$", {silent = true})

keymap('v', '<', '< gv', {silent = true})
keymap('v', '>', '> gv', {silent = true})

keymap("n", "U", "<CMD>earlier<CR>", {silent = true})
keymap("n", "R", "<CMD>later<CR>", {silent = true})

-- Highlights --
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=200})
  augroup END
]]


-------------------------------------------------------------------------------

set.shell = "bash"
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.encoding = "utf-8"
set.wrap = false
set.scrolloff = 6
set.undofile = true
set.hidden = true
-- set.autoindent = true
-- set.smartindent = true
set.cursorline = true
set.termguicolors = true
set.lazyredraw = true
set.pumheight = 12
set.linebreak = true
set.completeopt = 'menu,menuone,noselect'
set.signcolumn = 'yes'

set.showmode = false
set.wildignore = {
    '*/cache/*', '*/tmp/*', '*/venv/*', '*/node_modules/*', '*/.git/*'
}

set.background = 'dark'
wo.colorcolumn = '80'
set.mouse = 'a'


if vim.g.vscode == nil then
    vim.cmd [[
        highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
        match ExtraWhitespace /\s\+\%#\@<!$/
        au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        au InsertLeave * match ExtraWhitespace /\s\+$/
    ]]
end


---
keymap('n', '<leader>w', "<CMD>:update<CR>", {silent = true})

-- Change windows
keymap("n", "<C-h>", "<CMD>wincmd h<CR>")
keymap("n", "<C-j>", "<CMD>wincmd j<CR>")
keymap("n", "<C-k>", "<CMD>wincmd k<CR>")
keymap("n", "<C-l>", "<CMD>wincmd l<CR>")

keymap("n", "n", "nzz", {silent = true})
keymap("n", "N", "Nzz", {silent = true})
keymap("n", "*", "*zz", {silent = true})

keymap("n", "<C-d>", "<C-d>zz", {silent = true})
keymap("n", "<C-u>", "<C-u>zz", {silent = true})

keymap({"n"}, "<CR>", function()
    vim.cmd([[call append(line("."),   repeat([""], v:count1))]])
end)

vim.cmd([[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j']])
vim.cmd([[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k']])

keymap({"n", "x"}, "j",
               function() return vim.v.count > 0 and "j" or "gj" end,
               {noremap = true, expr = true})
keymap({"n", "x"}, "k",
               function() return vim.v.count > 0 and "k" or "gk" end,
               {noremap = true, expr = true})

keymap("n", "<c-f>",
               function() return ":e " .. vim.fn.expand("%:p:h") .. "/" end,
               {expr = true})


-------------
-- PLUGINS --
-------------

-- Trouble
keymap("n", "<leader>k", "<cmd>TroubleToggle<cr>", opts)

-- Gitmessenger
keymap("n", "<leader>lh", "<cmd>GitMessenger<cr>", opts)

-- Smooth scroll
keymap('n', '<ScrollWheelUp>', '<C-y>')
keymap('n', '<ScrollWheelDown>', '<C-e>')
keymap('i', '<ScrollWheelUp>', '<C-o><C-y>')
keymap('i', '<ScrollWheelDown>', '<C-o><C-e>')
keymap('v', '<ScrollWheelUp>', '<C-y>')
keymap('v', '<ScrollWheelDown>', '<C-e>')
