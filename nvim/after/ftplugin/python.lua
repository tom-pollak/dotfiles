local format = function()
    vim.cmd [[ call Black() ]]
    vim.cmd [[ Isort ]]
end

if vim.fn.executable("python") == 1 then
    vim.opt.makeprg = "python %"
else
    vim.opt.makeprg = "python3 %"
end


vim.keymap.set('n', '<leader>q', format, { silent = true })
vim.wo.colorcolumn = '88'
