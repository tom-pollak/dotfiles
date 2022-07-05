local ok, _ = pcall(vim.cmd, 'colorscheme PaperColor')
if not ok then
    vim.cmd 'colorscheme default' -- if the above fails, then use default
end

vim.o.background = 'dark'
vim.cmd[[highlight LineNr ctermfg=darkyellow]]
