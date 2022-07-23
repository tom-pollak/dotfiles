local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
      }
    }
  }
}

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

M.buffers = function()
    builtin.buffers({
    sort_lastused = true,
    ignore_current_buffer = true
})
end

M.live_grep = function()
    builtin.live_grep()
end

M.help_tags = function()
    builtin.help_tags()
end

M.dotfiles = function()
    builtin.find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/projects/dotfiles"
    })
end

M.find_files = function()
  builtin.find_files()
end

M.current_buffer_tags = function ()
    builtin.current_buffer_tags()
end

M.tags = function ()
    builtin.tags()
end
-- M.git_branches = function()
--     require("telescope.builtin").git_branches({
--         attach_mappings = function(_, map)
--             map('i', '<c-d>', actions.git_delete_branch)
--             map('n', '<c-d>', actions.git_delete_branch)
--             return true
--         end
--     })
-- end

M.vim_config = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim"
    })
end


return M
