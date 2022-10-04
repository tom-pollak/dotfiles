local M = {}
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local fb_actions = require "telescope".extensions.file_browser.actions
local telescope = require("telescope")

local setup = function()
    telescope.setup {
        defaults = {
            borderchars = { "─", " ", " ", " ", " ", " ", " ", " " },
            shorten_path = true,
            layout_strategy = "vertical",
            layout_config = {
                vertical = {
                    height = function(_, _, lines) return lines end,
                    width = function(_, cols, _) return cols end,
                    preview_height = function(_, _, lines)
                        local denom = 0.65
                        if lines < 40 then
                            denom = 0.33
                        end
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
                    ["<C-l>"] = function() vim.cmd "stopinsert" end,
                    ["<c-t>"] = trouble.open_with_trouble,
                    ["<c-q>"] = trouble.open_with_trouble,

                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<c-t>"] = trouble.open_with_trouble,
                    ["<c-q>"] = trouble.open_with_trouble,
                    --[[ ["i"] = function() vim.cmd "startinsert" end, ]]
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                }
            }
        },
        pickers = {
            buffers = { theme = "dropdown" },
            command_history = { theme = "dropdown" },
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            },
            file_browser = {
                grouped = true,
                initial_mode = "normal",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                    ["i"] = {
                        ["<C-i>"] = fb_actions.goto_parent_dir,
                    },
                    ["n"] = {
                        ["h"] = fb_actions.goto_parent_dir,
                        ["l"] = "select_default",
                        ["dd"] = fb_actions.remove,
                        ["<C-i>"] = fb_actions.goto_parent_dir,
                        ["<C-e>"] = fb_actions.goto_home_dir,
                        ["<C-w>"] = fb_actions.goto_cwd,
                        ["<C-h>"] = fb_actions.toggle_hidden,
                        ["<C-t>"] = fb_actions.change_cwd,
                        ["<A-r>"] = fb_actions.rename,
                        ["<A-m>"] = fb_actions.move,
                        ["<A-d>"] = fb_actions.remove,
                        ["<C-r>"] = function(prompt_bufnr)
                            local git_root_path =
                            require("plenary.job"):new({ command = "git", args = { "rev-parse", "--show-toplevel" } }):
                                sync()
                                [1]
                            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                            local finder = current_picker.finder
                            if finder.files then
                                finder.path = git_root_path
                            else
                                finder.cwd = git_root_path
                            end
                            require("telescope._extensions.file_browser.utils").redraw_border_title(current_picker)
                            current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
                        end
                    },
                },
            },
            dap = {
                theme = "cursor"
            },
            project = {
                theme = "cursor",
                base_dirs = {
                    "~/projects",
                }
            },
            ["ui-select"] = {
                require "telescope.themes".get_cursor()
            }
        }
    }
    -- require('telescope').load_extension('fzy_native')
    telescope.load_extension "file_browser"
    telescope.load_extension "project"
    telescope.load_extension "ui-select"
    telescope.load_extension 'dap'
end

M.setup = setup
return M
