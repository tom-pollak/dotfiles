local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")

local check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
end

local root_dir = function()
    return require("plenary.job"):new(
        { command = "git", args = { "rev-parse", "--show-toplevel" } }
    ):sync()[1]
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
--[[ vim.keymap.set('n', '<c-p>', project_files) ]]
vim.keymap.set('n', '<c-p>', git_files)
vim.keymap.set('n', '<leader>h', builtin.help_tags)
vim.keymap.set('n', '<c-e>', find_files)
vim.keymap.set('n', '<c-b>', buffers)
vim.keymap.set('n', '<leader>rg', function() live_grep(root_dir()) end)


vim.keymap.set('c', '<c-f>', command_history)
vim.keymap.set('c', '<c-r>', run_history)

vim.keymap.set('n', '<leader>a', builtin.resume)

vim.keymap.set('n', '<leader>cd', dotfiles)
vim.keymap.set('n', '<leader>cc', vim_config)

vim.keymap.set('n', "'", bookmarks_all)

vim.keymap.set('n', '<leader>rr', "<CMD>Telescope file_browser<CR>")
vim.keymap.set('n', '<leader>e', require 'telescope'.extensions.project.project)

-- Telekasten
vim.keymap.set('n', '<leader>cm', function() live_grep('~/projects/notes/notes/') end)
