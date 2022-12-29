local set = vim.opt

set.wrap = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.makeprg = [[nvr --remote-send '<CMD>MarkdownPreview<CR>']]
vim.g.tw = 80
vim.cmd [[filetype indent plugin on]]
set.showbreak = '++'

local format = function()
    vim.cmd [[ ! prettier --write % ]]
end

if not vim.g.vscode then
    vim.keymap.set('n', '<leader>q', format, { silent = true })
end

