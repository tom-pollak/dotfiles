local format = function()
    vim.cmd [[ update ]]
    vim.fn.system("rustfmt " .. vim.fn.expand('%'))
    vim.cmd [[ edit | TSBufEnable highlight ]]
    vim.cmd [[ write ]]
    print("File formatted.")
end

vim.keymap.set('n', '<leader>q', format, { silent = true })
--[[ vim.opt.makeprg = function(args)
    if args == "test" then
        return "cargo test"
    elseif args == "build" then
        return "cargo build"
    else
        return "cargo run"
    end

end ]]
