local ok, _ = pcall(vim.cmd, 'colorscheme github_dark_default')
-- ok = false
if not ok then
    vim.cmd 'colorscheme default' -- if the above fails, then use default
end

-- vim.highlight.create('CursorLineNr', {cterm='underline' ctermfg='Yellow' guifg='Yellow'}, false)
-- vim.o.background = 'dark'
-- vim.wo.colorcolumn = '80'
-- vim.highlight.create('ColorColumn', {ctermbg=238, guibg="grey"}, false)
-- vim.cmd 'highlight LineNr ctermfg=darkyellow'
-- vim.cmd 'highlight colorcolumn guibg=grey'
