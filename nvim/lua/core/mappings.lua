-- Mappings, independant of plugins

vim.keymap.set('n', '<Leader>w', '<CMD>update<CR>', { silent = true })
vim.keymap.set('n', '<Leader><CR>', '<CMD>update<CR><CMD>so %<CR>', { silent = true })

--[[ vim.keymap.set('i', 'jk', '<esc>', { silent = true, }) ]]

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })

vim.keymap.set({'n'}, '<CR>', function () vim.cmd [[call append(line("."),   repeat([""], v:count1))]] end)
vim.keymap.set({'n'}, '<S-CR>', function () vim.cmd [[call append(line(".")-1,   repeat([""], v:count1))]] end)

vim.cmd[[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j']]
vim.cmd[[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k']]

vim.keymap.set('n', '<c-f>', function() return ':e ' .. vim.fn.expand '%:p:h' .. '/' end, { expr = true })

vim.keymap.set('n', '<leader>rp', function() return vim.cmd(":lcd" .. vim.fn.expand('%:p:h') .. '/') end, { expr = true })

vim.keymap.set('n', '<leader>y', function() return ':!' end, { expr = true })

local t = function (s)
    return vim.api.nvim_replace_termcodes(s, true, true, true)
end

vim.keymap.set('n', '<c-;>', function() vim.cmd (t('normal <c-6>')) end)

vim.keymap.set('i', '<c-n>', '<c-o>e<c-o>a')
vim.keymap.set('i', '<c-m>', '<c-o>b<c-o>i')
vim.keymap.set('n', '<c-n>', 'e')
vim.keymap.set('n', '<c-m>', 'b')

-- Forward delete, (BS is C-h)
vim.keymap.set('i', '<C-d>', '<Del>')

vim.keymap.set('n', 'd', '"_d', {})
vim.keymap.set('n', 'D', '"_D', {})

vim.keymap.set('n', 's', 'd', {})
vim.keymap.set('n', 'ss', 'dd', {})
vim.keymap.set('n', 'S', 'D', {})

vim.keymap.set('n', 'c', '"_c', {})
vim.keymap.set('n', 'C', '"_C', {})

vim.keymap.set('n', 'x', '"_x', {})

vim.keymap.set('v', 'd', '"_d', {})
vim.keymap.set('v', 'c', '"_c', {})
vim.keymap.set('v', 's', 'd', {})

vim.keymap.set('n', '_', "<CMD>res +5<CR>")
vim.keymap.set('n', '+', "<CMD>res -5<CR>")
vim.keymap.set('n', '=', "<CMD>vertical res +5<CR>")
vim.keymap.set('n', '-', "<CMD>vertical res -5<CR>")

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
