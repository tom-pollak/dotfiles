local format = function()
    vim.cmd [[ update ]]
    vim.fn.system("rustfmt " .. vim.fn.expand('%'))
    vim.cmd [[ edit | TSBufEnable highlight ]]
    vim.cmd [[ write ]]
    print("File formatted.")
end
