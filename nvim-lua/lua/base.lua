-- Base config, independant of plugins

vim.wo.relativenumber = true
vim.wo.colorcolumn = '80'
vim.g.mapleader = ' '

local set = vim.opt

set.shell = "bash"
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.encoding="utf-8"
set.wrap = false
set.scrolloff = 8
set.undofile = true
set.smartcase = true
set.ignorecase = true

vim.cmd("set guicursor=n-v-c-i:block")

set.showmode = false
set.wildignore = { '*/cache/*', '*/tmp/*', '*/venv/*', '*/node_modules/*', '*/.git/*' }


vim.cmd("match errorMsg /\\s\\+$/") -- mark trailing white spaces as red
