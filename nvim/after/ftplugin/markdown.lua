local set = vim.opt_local

set.wrap = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.makeprg = [[nvr --remote-send '<CMD>MarkdownPreview<CR>']]
vim.g.tw = 80
vim.cmd [[filetype indent plugin on]]
set.showbreak = '++'
