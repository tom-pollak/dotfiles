local fn = vim.fn
local util = require("packer.util")
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup({
    function()
        use("wbthomason/packer.nvim")

        ---------------------------------------------------------------------------
        -- CODE
        ---------------------------------------------------------------------------

        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                {"p00f/nvim-ts-rainbow"},
            },
            config = function()
                require('nvim-treesitter.configs').setup ({
                    ensure_installed = "all",
                    ignore_install = {"phpdoc"},
                    sync_install = false,
                    highlight = {enable = true},
                    rainbow = {enable = true, extended_mode = true, max_file_lines = nil},
                })
            end,
            run = ":TSUpdate"
        })

        use ("tpope/vim-commentary")

        use({
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                vim.defer_fn(function()
                    require("copilot").setup({
                        suggestion = {
                            enabled = true,
                            auto_trigger = true,
                            keymap = {
                                accept = "<C-l>",
                                accept_word = "<C-n>",
                                accept_line = false,
                                decline = "<C-g>",
                                dismiss = "<C-g>"
                            }
                        },
                        filetypes = {markdown = true}
                    })
                end, 100)
            end
        })

        ---------------------------------------------------------------------------
        -- NAVIGATION
        ---------------------------------------------------------------------------

        use({
            "nvim-telescope/telescope.nvim",
            requires = { {"nvim-lua/plenary.nvim"}, {"kyazdani42/nvim-web-devicons"}},
            config = function()
                require("extensions.telescope-setup").setup()
            end
        })

        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                local trouble = require("trouble")
                trouble.setup({})
                trouble.next({skip_groups = true, jump = true})
                trouble.previous({skip_groups = true, jump = true})
            end
        })

        use({
            "chentoast/marks.nvim",
            config = function()
                require("marks").setup({
                    default_mappings = false,
                    bookmark_0 = {sign = "⚑"},
                    mappings = {
                        set_bookmark0 = "cm",
                        delete_bookmark = "dm",
                        delete_bookmark0 = "dam"
                    }
                })
            end
        })

        ---------------------------------------------------------------------------
        -- UTILS
        ---------------------------------------------------------------------------

        use({
            "tpope/vim-surround",
            config = function() vim.g.surround_no_insert_mappings = 1 end
        })

        use("tpope/vim-repeat")

        ---------------------------------------------------------------------------
        -- GIT
        ---------------------------------------------------------------------------

        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup({
                    on_attach = function(bufnr)
                        local gs = package.loaded.gitsigns
                        local opts = {buffer = bufnr}
                        vim.keymap.set("n", "<leader>n", gs.next_hunk, opts)
                        vim.keymap.set("n", "<leader>p", gs.prev_hunk, opts)
                        vim.keymap.set("n", "<leader>lo", gs.diffthis, opts)
                        vim.keymap.set("n", "<leader>lb",
                                       gs.toggle_current_line_blame, opts)
                        vim.keymap.set("n", "<leader>ld", gs.toggle_deleted,
                                       opts)
                        vim.keymap.set("n", "<leader>lp", gs.preview_hunk)
                    end
                })
            end
        })

        use({
            "rhysd/git-messenger.vim",
            config = function()
                vim.g.git_messenger_always_into_popup = 1
                vim.g.git_messenger_no_default_mappings = 1
            end
        })

        ---------------------------------------------------------------------------
        -- PRETTY
        ---------------------------------------------------------------------------

        use({
            "projekt0n/github-nvim-theme",
            config = function()
                require("github-theme").setup({
                    specs = {
                        github_dark_high_contrast = {bg_search = "#163356"}
                    },
                    groups = {
                        all = {
                            ColorColumn = {bg = "#1e2228"},
                            TreesitterContext = {bg = "#22272e"},
                            CursorLineNr = {fg = 'palette.yellow.bright'},
                            Search = {
                                fg = 'palette.white.bright',
                                bg = '#163356'
                            },
                            IncSearch = {
                                fg = 'palette.white.bright',
                                bg = '#163356'
                            },
                            IlluminatedWordText = {
                                gui = 'NONE',
                                bg = '#2d3340',
                                fg = 'NONE'
                            },
                            IlluminatedWordRead = {
                                gui = 'NONE',
                                bg = '#2d3340',
                                fg = 'NONE'
                            },
                            IlluminatedWordWrite = {
                                gui = 'NONE',
                                bg = '#2d3340',
                                fg = 'NONE'
                            },
                            IndentBlanklineChar = {
                                guifg = '#1e2228',
                                gui = 'nocombine'
                            },
                            IndentBlanklineContextChar = {
                                guifg = '#C678DD',
                                gui = 'nocombine'
                            },
                            TelescopeSelection = {
                                fg = 'palette.white.bright',
                                bg = '#163356'
                            },
                            PmenuSel = {
                                fg = 'palette.white.bright',
                                bg = '#163356'
                            }
                        }
                    },
                    darken = {
                        floats = true,
                        sidebars = {
                            enable = true,
                            list = {"qf", "packer", "terminal", "trouble"}
                        }
                    }
                })
                vim.cmd('colorscheme github_dark_high_contrast')
            end
        })

        use({
            "nvim-lualine/lualine.nvim",
            requires = {{"kyazdani42/nvim-web-devicons", opt = true}},
            config = function() require("extensions.lualine-setup") end
        })

        use({
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({default = true})
            end
        })

        use {
            "karb94/neoscroll.nvim",
            config = function()

                require'neoscroll'.setup {
                    mappings = {'<C-y>', '<C-e>'},
                    respect_scrolloff = true,
                    easing_function = "cubic"
                }
            end
        }

        ---------------------------------------------------------------------------
        -- DIAGNOSTIC
        ---------------------------------------------------------------------------

        use("dstein64/vim-startuptime")

        use({
            "lewis6991/impatient.nvim",
            config = function() require("impatient").enable_profile() end
        })

        ---------------------------------------------------------------------------

        if PACKER_BOOTSTRAP then require("packer").sync() end
    end,
    config = {
        compile_path = util.join_paths(vim.fn.stdpath("config"), "lua",
                                       "packer_compiled.lua")
    }
})
