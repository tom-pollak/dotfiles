local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
    defaults = {
        shorten_path = true,
        layout_strategy = "vertical",
        layout_config = {
            height = 0.9,
            width = 0.8
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<c-t>"] = trouble.open_with_trouble
            },
            n = {
            }
        }
    },
    pickers = {
        buffers = { theme = "dropdown" },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-d>"] = require "telescope".extensions.file_browser.actions.goto_parent_dir
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
        project = {
            theme = "dropdown",
            base_dirs = {
                "~/projects",
                "~/co/spyglass/applications"
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
--[[ require('telescope').load_extension('vim_bookmarks') ]]
