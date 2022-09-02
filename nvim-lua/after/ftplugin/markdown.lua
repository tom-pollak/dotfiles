local set = vim.opt

set.wrap = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.makeprg = [[nvr --remote-send '<CMD>MarkdownPreview<CR>']]

vim.wo.colorcolumn = '80'
vim.g.tw=80
vim.cmd[[filetype indent plugin on]]

local format = function()
    vim.cmd [[ ! prettier --write % ]]
end

vim.keymap.set('n', '<leader>q', format, { silent = true })
