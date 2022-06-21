-- Plugin specific mappings

require('treesitter-config')

vim.api.nvim_set_keymap("n", "<c-p>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-b>", "<CMD>lua require'telescope-config'.buffers()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-c>", "<CMD>lua require'telescope-config'.live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>c", "<CMD>lua require'telescope-config'.config_files()<CR>", {noremap = true, silent = true})


vim.g.pear_tree_repeatable_expand = 0
vim.g.pear_tree_map_special_keys = 0

vim.api.nvim_set_keymap("n", "<c-n>", "<CMD>lua require'tree-config'.toggle_replace()<CR>", {noremap = true})
