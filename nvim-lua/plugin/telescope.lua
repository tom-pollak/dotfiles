local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")

local check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
end

local root_dir = function()
    if check_git_workspace() then
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir:sub(1,-5)
    else
        return vim.fn.getcwd()
    end
end

local git_files = function()
    builtin.git_files({
        --[[ sort_lastused = true, ]]
        --[[ ignore_current_buffer = true ]]
    })
end

local find_files = function()
    builtin.find_files({
        sort_lastused = true,
        ignore_current_buffer = true
    })
end

local project_files = function()
    if check_git_workspace() then
        return git_files()
    else
        return find_files()
    end
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

local live_grep = function(cwd)
    builtin.live_grep({
        cwd = cwd
    })
end

local dotfiles = function()
    builtin.find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/projects/dotfiles"
    })
end

local bookmarks_all = function()
    vim.cmd [[BookmarksQFListAll]]
    builtin.quickfix({
        prompt_title = "< Bookmarks >"
    })
    vim.cmd [[cclose]]
end

local command_history = function()
    builtin.command_history({
        prompt_title = "< Command History >",
        sorter = sorters.fuzzy_with_index_bias()

    })
end

local run_history = function()
    builtin.command_history({
        prompt_title = "< Run History >",
        default_text = [[!]],
        sorter = sorters.fuzzy_with_index_bias()


    })
end

-- Telescope
--[[ vim.keymap.set('n', '<c-p>', project_files, opts) ]]
vim.keymap.set('n', '<c-p>', git_files, opts)
vim.keymap.set('n', '<leader>h', builtin.help_tags, opts)
vim.keymap.set('n', '<c-e>', find_files, opts)
vim.keymap.set('n', '<c-b>', buffers, opts)
vim.keymap.set('n', '<c-c>', function() live_grep(root_dir()) end, opts)


vim.keymap.set('c', '<c-f>', command_history, opts)
vim.keymap.set('c', '<c-r>', run_history, opts)

vim.keymap.set('n', '<leader>a', builtin.resume, opts)

vim.keymap.set('n', '<leader>cd', dotfiles, opts)
vim.keymap.set('n', '<leader>cc', vim_config, opts)

vim.keymap.set('n', "'", bookmarks_all, opts)

--[[ vim.keymap.set('n', '\'', require('telescope').extensions.vim_bookmarks.all(), opts) ]]


vim.keymap.set('n', '<leader>rr', "<CMD>Telescope file_browser<CR>", opts)
--[[ vim.keymap.set('n', '<leader>e', require 'telescope'.extensions.project.project, opts) ]]

-- Telekasten
vim.keymap.set('n', '<leader>mc', function() live_grep('~/notes/') end, opts)
vim.keymap.set('n', '<leader>md', function() live_grep('~/zettelkasten/') end, opts)
