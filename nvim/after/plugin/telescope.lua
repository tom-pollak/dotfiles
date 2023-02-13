local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")

local opts = require("telescope.themes").get_ivy({
    sort_lastused = true,
    sort_mru = true,
    ignore_current_buffer = true
})

local root_dir = function()
    local gitdir = require("plenary.job"):new({
        command = "git",
        args = {"rev-parse", "--show-toplevel"}
    }):sync()[1]
    print(gitdir)
    if gitdir ~= nil then return gitdir end

    if vim.lsp.get_active_clients()[1] ~= nil then
        return vim.lsp.get_active_clients()[1].config.root_dir
    end

    return vim.fn.getcwd()
end

local project_files = function()
    builtin.find_files({cwd = root_dir(), disable_coordinates = true})
end

local buffers = function() builtin.buffers(opts) end

local vim_config = function()
    builtin.find_files({prompt_title = "< VimRC >", cwd = "$HOME/.config/nvim"})
end

local live_grep = function()
    builtin.live_grep({cwd = root_dir(), disable_coordinates = true})
end

local dotfiles = function()
    builtin.find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/projects/dotfiles"
    })
end

local bookmarks_all = function()
    vim.cmd([[BookmarksQFListAll]])
    builtin.quickfix({prompt_title = "< Bookmarks >"})
    vim.cmd([[cclose]])
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
vim.keymap.set("n", "<c-p>", project_files)
vim.keymap.set("n", "<leader>f", live_grep)
vim.keymap.set("n", "<c-b>", buffers)

vim.keymap.set("c", "<c-f>", command_history)
vim.keymap.set("c", "<c-r>", run_history)

vim.keymap.set("n", "<leader>a", builtin.resume)

vim.keymap.set("n", "<leader>cd", dotfiles)
vim.keymap.set("n", "<leader>cc", vim_config)

vim.keymap.set("n", "<leader>h", builtin.help_tags)

vim.keymap.set("n", "'", bookmarks_all)

vim.keymap.set("n", "<leader>rr",
               require("telescope").extensions.project.project)

vim.keymap.set("n", "<leader>m", function()
    return require("telescope").extensions.notepad.notepad(opts)
end)

vim.keymap.set("n", "<leader>rd", function ()
    print(root_dir())
end)
