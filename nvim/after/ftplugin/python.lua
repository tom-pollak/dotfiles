local format = function()
    vim.cmd [[ call Black() ]]
    vim.cmd [[ Isort ]]
end

if vim.fn.executable("python") == 1 then
    vim.opt.makeprg = "pytest %"
else
    vim.opt.makeprg = "pytest %"
end


if not vim.g.vscode then
    vim.keymap.set('n', '<leader>q', format, { silent = true })
end
vim.wo.colorcolumn = '88'
