-- Base config, independant of plugins

local set = vim.opt
local g = vim.g
local wo = vim.wo

set.clipboard = 'unnamedplus'
wo.relativenumber = true
wo.number = true
g.mapleader = ' '
g.updatetime = 150

set.shell = "bash"
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.encoding = "utf-8"
set.wrap = false
set.scrolloff = 6
set.undofile = true
set.smartcase = true
set.ignorecase = true
set.completeopt = 'menu,menuone,noselect'
set.hidden = true
set.autoindent = true
set.smartindent = true
set.cursorline = true
set.termguicolors = true
set.lazyredraw = true
set.pumheight = 12
set.linebreak = true
--[[ set.ls = 0 ]]
--[[ set.ch = 0 ]]
--[[ set.autochdir = true ]]

--[[ vim.cmd("set guicursor=n-v-c-i:block") ]]

set.showmode = false
set.wildignore = { '*/cache/*', '*/tmp/*', '*/venv/*', '*/node_modules/*', '*/.git/*' }

set.background = 'dark'
wo.colorcolumn = '80'
set.mouse = 'a'


-- vim.cmd("match errorMsg /\\s\\+$/") -- mark trailing white spaces as red
--
-- set.listchars="tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"

-- vim.highlight.create('ColorColumn', {ctermbg=238, guibg="grey"}, false)


local yank_augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_augroup,
  desc = 'Highlight on yank',
  callback = function(_)
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})

-- Fix mouse
--[[ local mouse_augroup = vim.api.nvim_create_augroup('mouse', {clear = true}) ]]
--[[ vim.api.nvim_create_autocmd('FocusGained', { ]]
--[[     group = mouse_augroup, ]]
--[[     desc = 'Fix mouse', ]]
--[[     callback = function(_) ]]
--[[         set.mouse = "a" ]]
--[[     end ]]
--[[ }) ]]
--[[]]
--[[ vim.api.nvim_create_autocmd('FocusLost', { ]]
--[[     group = mouse_augroup, ]]
--[[     desc = 'Fix mouse', ]]
--[[     callback = function(_) ]]
--[[         set.mouse = "" ]]
--[[     end ]]
--[[ }) ]]

-- vim.cmd [[
--   augroup numbertoggle
--     autocmd!
--     autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
--     autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
--   augroup END
-- ]]
