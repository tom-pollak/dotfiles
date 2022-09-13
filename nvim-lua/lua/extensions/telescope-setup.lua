local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local fb_actions = require "telescope".extensions.file_browser.actions

require("telescope").setup {
    defaults = {
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        shorten_path = true,
        layout_strategy = "vertical",
        layout_config = {
            height = vim.o.lines,
            width = vim.o.columns,
            --[[ height = 0.9, ]]
            --[[ width = 0.9 ]]
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<c-t>"] = trouble.open_with_trouble,
                ["<C-l>"] = function() vim.cmd "stopinsert" end,
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
            layout_strategy = "vertical",
            layout_config = {
                prompt_position = "bottom",
                preview_height = 0.6,
            },
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-i>"] = fb_actions.goto_parent_dir,
                },
                ["n"] = {
                    ["h"] = fb_actions.goto_parent_dir,
                    ["l"] = "select_default",
                    ["<C-i>"] = fb_actions.goto_parent_dir,
                    ["<C-e>"] = fb_actions.goto_home_dir,
                    ["<C-w>"] = fb_actions.goto_cwd,
                    ["<C-t>"] = fb_actions.change_cwd,
                    ["<A-r>"] = fb_actions.rename,
                    ["<A-m>"] = fb_actions.move,
                    ["<A-d>"] = fb_actions.remove,
                },
            },
        },
        dap = {
            theme = "dropdown"
        },
        project = {
            theme = "dropdown",
            base_dirs = {
                "~/projects",
                --[[ "~/co/spyglass/applications" ]]
            }
        },
        ["ui-select"] = {
            require "telescope.themes".get_cursor()
        }
    }
}
-- require('telescope').load_extension('fzy_native')
require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"
require("telescope").load_extension "ui-select"
require('telescope').load_extension 'dap'
