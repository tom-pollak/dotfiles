local fn = vim.fn
local util = require 'packer.util'
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup({ function()
    use 'wbthomason/packer.nvim'

    ---------------------------------------------------------------------------
    -- LSP
    ---------------------------------------------------------------------------

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    }

    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
        config = function()
            vim.g.cursorhold_updatetime = 100
            require('nvim-lightbulb').setup({
                autocmd = {
                    enabled = true,
                },
                status_text = {
                    enabled = true,
                }
            })
        end
    }

    ---------------------------------------------------------------------------
    -- CODE
    ---------------------------------------------------------------------------

    use {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.8.1',
        requires = {
            { 'p00f/nvim-ts-rainbow' },
            { 'JoosepAlviste/nvim-ts-context-commentstring' },
            --[[ { 'nvim-treesitter/nvim-treesitter-context', bang = true }, ]]
        },
        config = function()
            require 'extensions.treesitter-setup'
        end,
        run = ':TSUpdate'
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                -- Treesitter comment context setup
                pre_hook = function(ctx)
                    local U = require 'Comment.utils'

                    local location = nil
                    if ctx.ctype == U.ctype.block then
                        location = require('ts_context_commentstring.utils').get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = require('ts_context_commentstring.utils').get_visual_start_location()
                    end

                    return require('ts_context_commentstring.internal').calculate_commentstring {
                        key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
                        location = location,
                    }
                end,
            }
        end,
        requires = { { 'JoosepAlviste/nvim-ts-context-commentstring' } }
    }

    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                    suggestion = {
                        enabled = true,
                        auto_trigger = false,
                        keymap = {
                            accept = "<C-l>",
                            accept_word = false,
                            accept_line = false,
                            decline = "<C-g>",
                            next = "<C-n>",
                            prev = "<C-p>",
                            dismiss = "<C-\\>",
                        },
                    }

                }
            end, 100)
        end,
    }

    ---------------------------------------------------------------------------
    -- NAVIGATION
    ---------------------------------------------------------------------------

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim' },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            require 'extensions.telescope-setup'.setup()
        end
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            local trouble = require("trouble")
            trouble.setup {}
            trouble.next({ skip_groups = true, jump = true })
            trouble.previous({ skip_groups = true, jump = true })
        end
    }

    use {
        'stevearc/qf_helper.nvim',
        config = function()
            require 'qf_helper'.setup({
                prefer_loclist = true, -- Used for QNext/QPrev (see Commands below)
                sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
                quickfix = {
                    autoclose = true, -- Autoclose qf if it's the only open window
                    default_bindings = true, -- Set up recommended bindings in qf window
                    default_options = true, -- Set recommended buffer and window options
                    max_height = 10, -- Max qf height when using open() or toggle()
                    min_height = 1, -- Min qf height when using open() or toggle()
                    track_location = 'cursor', -- Keep qf updated with your current location
                    -- Use `true` to update position as well
                },
                loclist = { -- The same options, but for the loclist
                    autoclose = true,
                    default_bindings = true,
                    default_options = true,
                    max_height = 10,
                    min_height = 1,
                    track_location = 'cursor',
                },
            })

        end
    }

    use {
        'chentoast/marks.nvim',
        config = function()
            require 'marks'.setup {
                default_mappings = false,
                bookmark_0 = {
                    sign = "⚑",
                },
                mappings = {
                    set_bookmark0 = "cm",
                    delete_bookmark = "dm",
                    delete_bookmark0 = "dam"
                }
            }
        end
    }

    ---------------------------------------------------------------------------
    -- MOVEMENT
    ---------------------------------------------------------------------------

    use {
        "ggandor/leap.nvim",
        config = function()
            local leap = require 'leap'
            leap.setup {}
        end
    }

    use {
        'rhysd/clever-f.vim',
        config = function()
            vim.g.clever_f_smart_case = 1
            vim.g.clever_f_across_no_line = 1
            vim.g.clever_f_chars_match_any_signs = ';'
        end
    }

    ---------------------------------------------------------------------------
    -- UTILS
    ---------------------------------------------------------------------------

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'tpope/vim-surround',
        config = function()
            vim.g.surround_no_insert_mappings = 1
        end
    }

    use 'tpope/vim-repeat'

    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-t>]],
                size = 25,
                shell = "fish"
            })
        end
    }

    use {
        'zegervdv/nrpattern.nvim',
        config = function()
            require "nrpattern".setup()
        end,
    }

    ---------------------------------------------------------------------------
    -- GIT
    ---------------------------------------------------------------------------

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local opts = { buffer = bufnr }
                    vim.keymap.set("n", "<leader>n", gs.next_hunk, opts)
                    vim.keymap.set("n", "<leader>p", gs.prev_hunk, opts)
                    vim.keymap.set('n', '<leader>lo', gs.diffthis, opts)
                    vim.keymap.set('n', '<leader>lb', gs.toggle_current_line_blame, opts)
                    vim.keymap.set('n', '<leader>ld', gs.toggle_deleted, opts)
                end
            }
        end
    }

    use {
        'rhysd/git-messenger.vim',
        config = function()
            vim.g.git_messenger_always_into_popup = 1
            vim.g.git_messenger_no_default_mappings = 1
        end
    }

    use {
        'kdheepak/lazygit.nvim',
        config = function()
            if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
                vim.env.GIT_EDITOR = [[nvr -cc split --remote-wait +'set bufhidden=wipe']]
            end
        end
    }


    ---------------------------------------------------------------------------
    -- NOTES
    ---------------------------------------------------------------------------

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        'renerocksai/telekasten.nvim',
        cmd = "Telekasten",
        config = function()
            local home = vim.fn.expand("~/projects/notes/notes/drafts")
            require 'telekasten'.setup {
                home = home,
                take_over_my_home = true
            }
        end
    }

    ---------------------------------------------------------------------------
    -- PRETTY
    ---------------------------------------------------------------------------

    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                theme_style = "dark_default",
                sidebars = { "qf", "packer", "terminal", "trouble" },
                colors = {
                    bg_search      = "#163356",
                    bg             = '#0d1117',
                    cursor_line_nr = "#FFEA00"
                },
                overrides = function(_)
                    return {
                        ColorColumn = { bg = "#292929" },
                        TreesitterContext = { bg = '#090c10' }
                    }
                end,
                dark_float = true,
                dark_sidebar = true,
            })
        end
    })


    use {
        'nvim-lualine/lualine.nvim',
        requires = { { 'kyazdani42/nvim-web-devicons', opt = true },
        },
        config = function()
            require 'extensions.lualine'
        end
    }

    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require 'nvim-web-devicons'.setup {
                default = true;
            }
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.cmd [[ highlight IndentBlanklineChar guifg=#292929 gui=nocombine ]]
            vim.cmd [[ highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine ]]
            require 'indent_blankline'.setup {
                show_trailing_blankline_indent = false,
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = false,
            }
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    }

    ---------------------------------------------------------------------------
    -- DIAGNOSTIC
    ---------------------------------------------------------------------------

    use 'dstein64/vim-startuptime'

    use {
        'lewis6991/impatient.nvim',
        config = function()
            require 'impatient'.enable_profile()
        end
    }

    ---------------------------------------------------------------------------
    -- RUST
    ---------------------------------------------------------------------------

    use {
        'simrat39/rust-tools.nvim',
        after = { "mason-lspconfig.nvim" },
        ft = { "rust", "rs" },
        config = function()
            local rt = require 'rust-tools'
            local opts = {
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                server = {
                    standalone = true,
                    on_attach = function(client, bufnr)
                        require 'extensions.lsp-attach'.on_attach(client, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "ga", rt.code_action_group.code_action_group, { buffer = bufnr })
                        --[[ vim.keymap.set('n', '<leader>dd', rt.debuggables.debuggables, { buffer = bufnr }) ]]
                        vim.keymap.set('n', '<leader>dd', rt.runnables.runnables, { buffer = bufnr })
                        vim.keymap.set("n", "ga", rt.code_action_group.code_action_group, { buffer = bufnr })
                        -- Gives errors
                        --[[ vim.keymap.set("n", "J", rt.join_lines.join_lines, { buffer = bufnr }) ]]

                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                -- default: `cargo check`
                                command = "clippy"
                            },
                            inlayHints = { locationLinks = false }, -- Only supports end of line atm
                        }
                    }
                }
            }
            rt.setup(opts)
        end
    }

    ---------------------------------------------------------------------------

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end



end,
    config = {
        compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua')
    } })
