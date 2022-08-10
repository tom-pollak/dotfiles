-- Mappings, independant of plugins

vim.api.nvim_set_keymap('n', '<Leader>w', ':update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><CR>', ':so %<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<', '< gv', { silent = true })
vim.api.nvim_set_keymap('v', '>', '> gv', { silent = true })

vim.api.nvim_set_keymap('i', 'jk', '<esc>', { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', 'n', 'nzz', { silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { silent = true })
vim.api.nvim_set_keymap('n', '*', '*zz', { silent = true })

vim.cmd("nnoremap <expr> j (v:count > 5 ? \"m'\" . v:count : '') . 'j'")
vim.cmd("nnoremap <expr> k (v:count > 5 ? \"m'\" . v:count : '') . 'k'")

vim.keymap.set('n', '<c-f>', function() return ':e ' .. vim.fn.expand '%:p:h' .. '/' end, { expr = true })

vim.keymap.set('n', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'D', '"_D', { noremap = true })

vim.keymap.set('n', 's', 'd', { noremap = true })
vim.keymap.set('n', 'ss', 'dd', { noremap = true })
vim.keymap.set('n', 'S', '"_D', { noremap = true })

vim.keymap.set('n', 'c', '"_c', { noremap = true })
vim.keymap.set('n', 'C', '"_C', { noremap = true })

vim.keymap.set('n', 'x', '"_x', { noremap = true })

vim.keymap.set('v', 'd', '"_d', { noremap = true })
vim.keymap.set('v', 'c', '"_c', { noremap = true })
vim.keymap.set('v', 's', 'd', { noremap = true })

-- vim.keymap.set('n', '<leader>c', function() return ':! ' end,
--     { noremap = true, expr = true })
