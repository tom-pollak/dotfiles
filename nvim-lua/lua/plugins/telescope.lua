local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")


local project_files = function()
  local ok = pcall(require"telescope.builtin".git_files, {})
  if not ok then require"telescope.builtin".find_files({}) end
end

local buffers = function()
    builtin.buffers({
    sort_lastused = true,
    ignore_current_buffer = true
})
end


local vim_config = function()
    builtin.find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim"
    })
end

local dotfiles = function()
    builtin.find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/projects/dotfiles"
    })
end

-- Telescope
vim.keymap.set('n', '<c-p>', project_files, opts)
vim.keymap.set('n', '<leader>h', builtin.help_tags, opts)
vim.keymap.set('n', '<c-e>', builtin.find_files, opts)
vim.keymap.set('n', '<c-b>', buffers, opts)
vim.keymap.set('n', '<c-c>', builtin.live_grep, opts)

vim.keymap.set('n', '<leader>f', builtin.lsp_workspace_symbols, opts)
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>a', builtin.resume, opts)

vim.keymap.set('n', '<leader>cd', dotfiles, opts)
vim.keymap.set('n', '<leader>cc', vim_config, opts)

vim.keymap.set('n', '<leader>m', builtin.marks, opts)
