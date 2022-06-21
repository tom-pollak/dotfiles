local actions = require("telescope.actions")

require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
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
    require"telescope.builtin".buffers()
end

M.live_grep = function()
    require"telescope.builtin".live_grep()
end

M.config_files = function()
    require"telescope.builtin".find_files()
end

return M
