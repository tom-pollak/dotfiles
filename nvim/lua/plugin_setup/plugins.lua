local opts = { noremap = true, silent = true }

vim.keymap.set('c', '!!', function() return "AsyncRun " end, { expr = true })

-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", opts)


-- Ranger
-- vim.api.nvim_set_keymap("n", "<leader>r", "<CMD>Ranger<CR>", opts)


-- TMUX Navigator
vim.api.nvim_set_keymap("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", opts)

-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr= require'treesitter'nvim_treesitter#foldexpr()

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>rl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>rk", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)

-- Gitmessenger
vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>GitMessenger<cr>",
    { noremap = true }
)

-- Copilot
vim.keymap.set("n", "<leader>gp", "<cmd>Copilot split<cr>")


-- Leap
--[[ local leap = require 'leap'
vim.keymap.set({ 'n', 'x', 'o' }, '<Tab>', function()
    leap.leap {}
end, { noremap = true })

vim.keymap.set({ 'n', 'x', 'o' }, '<S-Tab>', function()
    leap.leap { backward = true }
end, { noremap = true })

vim.keymap.set({ 'n', 'x', 'o' }, '"', function() require 'extensions.leap-ast'.leap() end, {}) ]]

-- Context
vim.keymap.set({ 'n' }, '<leader>i', "<CMD>TSContextToggle<CR>", { silent = true })

-- LazyGit
vim.keymap.set('n', '<leader>j', "<CMD>LazyGit<CR>", opts)

-- Telekasten
vim.keymap.set('n', '<leader>m', function()
    vim.cmd(":Telekasten") -- I have no idea why I can't do <CMD>Telekasten<CR> but it don't work
end)

vim.keymap.set('n', '<Esc>', '<CMD>nohl<CR><Esc><CMD>call clever_f#reset()<CR>', { silent = true })

vim.keymap.set('v', '<', '< <CMD>GitMessengerClose<CR>gv', { silent = true })
vim.keymap.set('v', '>', '> <CMD>GitMessengerClose<CR>gv', { silent = true })


--[[ vim.api.nvim_create_user_command('Load', function() ]]
--[[     vim.g.ide = false ]]
--[[     vim.g.minimal = false ]]
--[[     require 'startup' ]]
--[[ end, { nargs = 0 }) ]]
--[[]]
vim.api.nvim_create_user_command('LoadIde', function()
    vim.g.ide = true
    vim.g.minimal = false
    require 'startup'
end, { nargs = 0 })
--[[]]
--[[ vim.api.nvim_create_user_command('LoadMinimal', function() ]]
--[[     vim.g.ide = false ]]
--[[     vim.g.minimal = true ]]
--[[     require 'startup' ]]
--[[ end, { nargs = 0 }) ]]

vim.cmd [[
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
]]
