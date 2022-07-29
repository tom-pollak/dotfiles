local ok, _ = pcall(vim.cmd, 'colorscheme github_dark_default')

if not ok then
    vim.cmd 'colorscheme default' -- if the above fails, then use default
end

vim.o.background = 'dark'
vim.wo.colorcolumn = '80'
