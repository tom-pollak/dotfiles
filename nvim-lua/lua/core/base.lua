-- Base config, independant of plugins

vim.wo.relativenumber = true
vim.wo.number = true
vim.g.mapleader = ' '

local set = vim.opt

set.shell = "bash"
set.tabstop = 4
set.shiftwidth = 4
-- set.softtabstop = 4
set.expandtab = true
set.encoding = "utf-8"
set.wrap = false
set.scrolloff = 4
set.undofile = true
set.smartcase = true
set.ignorecase = true
set.completeopt = 'menu,menuone,noselect'
set.hidden = true
set.autoindent = true
set.smartindent = true
set.cursorline = true
set.termguicolors = true

vim.cmd("set guicursor=n-v-c-i:block")

set.showmode = false
set.wildignore = { '*/cache/*', '*/tmp/*', '*/venv/*', '*/node_modules/*', '*/.git/*' }


-- vim.cmd("match errorMsg /\\s\\+$/") -- mark trailing white spaces as red
--
-- set.listchars="tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"

-- vim.highlight.create('ColorColumn', {ctermbg=238, guibg="grey"}, false)

vim.o.background = 'dark'
vim.wo.colorcolumn = '80'

-- vim.cmd [[
--     augroup highlight_yank
--         autocmd!
--         au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
--     augroup END
-- ]]

local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    desc = 'Highlight on yank',
    callback = function(event)
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end
})

-- vim.cmd [[
--   augroup numbertoggle
--     autocmd!
--     autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
--     autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
--   augroup END
-- ]]
