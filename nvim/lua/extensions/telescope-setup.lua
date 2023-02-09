local M = {}
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

local setup = function()
    telescope.setup {
        defaults = {
            borderchars = {"─", " ", " ", " ", " ", " ", " ", " "},
            shorten_path = true,
            layout_strategy = "bottom_pane",
            layout_config = {
                vertical = {
                    height = function(_, _, lines)
                        return lines
                    end,
                    width = function(_, cols, _) return cols end,
                    preview_height = function(_, _, lines)
                        local denom = 0.65
                        if lines < 40 then denom = 0.33 end
                        return math.floor(lines * denom)
                    end,
                    preview_cutoff = 20,
                    prompt_position = "bottom"
                }
            },
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-l>"] = function()
                        vim.cmd "stopinsert"
                    end,
                    ["<c-t>"] = trouble.open_with_trouble,
                    ["<c-q>"] = trouble.open_with_trouble

                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<c-t>"] = trouble.open_with_trouble,
                    ["<c-q>"] = trouble.open_with_trouble,
                    --[[ ["i"] = function() vim.cmd "startinsert" end, ]]
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous
                }
            }
        },
        pickers = {
            buffers = {theme = "dropdown"},
            command_history = {theme = "dropdown"}
        },
        extensions = {
            project = {theme = "cursor", base_dirs = {"~/projects"}},
            ["ui-select"] = {require"telescope.themes".get_cursor()},
            notepad = {notes_directory = "~/Desktop/notes"}
        }
    }
    telescope.load_extension "project"
    telescope.load_extension "ui-select"
    telescope.load_extension "notepad"
end

M.setup = setup
return M
