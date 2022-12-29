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
set.hidden = true
set.autoindent = true
set.smartindent = true
set.cursorline = true
set.termguicolors = true
set.lazyredraw = true
set.pumheight = 12
set.linebreak = true

-- set.signcolumn = 'yes'
-- set.completeopt = 'menu,menuone,noselect'
-- vim.cmd("set guicursor=n-v-c-i:block")

set.showmode = false
set.wildignore = { '*/cache/*', '*/tmp/*', '*/venv/*', '*/node_modules/*', '*/.git/*' }

set.background = 'dark'
wo.colorcolumn = '80'
set.mouse = 'a'


local yank_augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_augroup,
  desc = 'Highlight on yank',
  callback = function(_)
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})
