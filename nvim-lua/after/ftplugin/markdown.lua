
vim.opt.wrap = true

local format = function()
    vim.cmd [[ ! prettier --write % ]]
end

vim.keymap.set('n', '<leader>q', format, { silent = true })
