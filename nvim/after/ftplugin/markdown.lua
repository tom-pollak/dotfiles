local set = vim.opt

set.wrap = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.makeprg = [[nvr --remote-send '<CMD>MarkdownPreview<CR>']]
vim.g.tw = 80
vim.cmd [[filetype indent plugin on]]
set.showbreak = '++'

--[[ set.columns = 80 ]]

--[[ vim.cmd("autocmd VimResized *.md if (&columns > 80) | set g:old_columns=columns | set columns=80 |  endif") ]]

local format = function()
    vim.cmd [[ ! prettier --write % ]]
end

if not vim.g.vscode then
    vim.keymap.set('n', '<leader>q', format, { silent = true })
end

--[[ local function set_columns() ]]
--[[     if vim.opt.columns > 80 then ]]
--[[         vim.g.previous_columns = vim.opt.columns ]]
--[[         vim.opt.columns = 80 ]]
--[[     end ]]
--[[ end ]]
--[[]]
--[[ vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, { ]]
--[[     pattern = { "*.md" }, ]]
--[[     callback = set_columns, ]]
--[[ }) ]]
--[[]]
--[[ local delete_markdown_style = function() ]]
--[[     vim.g.tw = nil ]]
--[[     require('startup') ]]
--[[ end ]]
--[[]]
--[[ vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, { ]]
--[[     pattern = { "*.md" }, ]]
--[[     callback = delete_markdown_style, ]]
--[[ }) ]]
