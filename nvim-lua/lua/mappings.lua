-- Mappings, independant of plugins

vim.api.nvim_set_keymap('n', '<Leader>w', ':update<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>o', ':nohl<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader><CR>', ':so %<CR>', {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<', '< gv', {silent = true})
vim.api.nvim_set_keymap('v', '>', '> gv', {silent = true})

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', 'n', 'nzz', {silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {silent = true})
vim.api.nvim_set_keymap('n', '*', '*zz', {silent = true})

vim.cmd("nnoremap <expr> k (v:count > 5 ? \"m'\" . v:count : '') . 'k'")
vim.cmd("nnoremap <expr> j (v:count > 5 ? \"m'\" . v:count : '') . 'j'")

function get_path()
    return vim.fn.expand("%:p:h")
end

-- "e " .. vim.fn.expand("%:p:h") ..">/"
-- vim.api.nvim_set_keymap('n', '<C-f>', "require'find-by-path'.find_by_path()", {noremap = true, expr = true} )
-- vim.api.nvim_set_keymap('n', '<C-f>', ":e " .. vim.fn.expand("%:p:h") .. "/", {noremap = true} )
-- vim.keymap.set('n', '<C-f>', ":e " .. string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), ''), ':p:~:.'), {noremap = true} )
-- vim.keymap.set('n', '<c-f>', ":e <c-r>=expand('%:p:h')<cr>/")
vim.keymap.set('n', '<c-f>', function () return ':e ' ..  vim.fn.expand '%:p:h' .. '/' end, { expr = true })

-- vim.api.nvim_create_autocmd('filetype', {
--   pattern = 'netrw',
--   desc = 'Better mappings for netrw',
--   callback = function()
--     local bind = function(lhs, rhs)
--       vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
--     end
--
--
--     -- rename file
--     bind('r', 'R')
--     -- new file
--     bind('n', '%')
--     bind('h', '-')
--     bind('l', '<CR>')
--     bind('J', '3j')
--     bind('K', '3k')
--   end
-- })
