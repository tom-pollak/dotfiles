local format = function()
    vim.cmd [[ call Black() ]]
    vim.cmd [[ Isort ]]
end

vim.keymap.set('n', '<leader>q', format, { silent = true })
