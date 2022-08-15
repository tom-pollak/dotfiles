local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    use {
        'neovim/nvim-lspconfig',
        requires = { 'williamboman/nvim-lsp-installer' },
        config = function()
            require('nvim-lsp-installer').setup({
                automatic_installation = true,
                ensure_installed = {
                    "rust_analyzer",
                    "sumneko_lua",
                    "clangd",
                    "pyright"
                }
            })
        end
    }

    use {
        'averms/black-nvim',
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
                    -- text = "💡",
                    -- -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
                    -- hl_mode = "combine",

                }
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
                    set_bookmark0 = "m",
                    delete_bookmark = "dm",
                    delete_bookmark0 = "cm"
                }
            }
        end
    }

    -- -- Not that good
    -- use {
    --     'jubnzv/virtual-types.nvim',
    -- }

    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup {}
        end
    }

    use {
        'onsails/lspkind.nvim',
        -- config = function ()
        --     require "lspkind".setup {}
        -- end
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- 'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim'
            -- 'hrsh7th/cmp-cmdline',
        },
        config = function()
            require 'plugins.cmp-setup'
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
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim' },
            {
                'nvim-telescope/telescope-frecency.nvim',
                requires = { "tami5/sqlite.lua" }
            },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            --[[ { "tom-anders/telescope-vim-bookmarks.nvim" } ]]
        },
        config = function()
            require 'plugins.telescope-setup'
        end
    }

    use {
        'andymass/vim-matchup',
        config = function()
            vim.g.loaded_matchit = 1
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'p00f/nvim-ts-rainbow' },
            { 'JoosepAlviste/nvim-ts-context-commentstring' },
            { 'nvim-treesitter/nvim-treesitter-context' },
            { 'andymass/vim-matchup' }
        },
        config = function()
            require 'plugins.treesitter-setup'
        end
    }

    use {
        'lewis6991/spaceless.nvim',
        config = function()
            require 'spaceless'.setup()
        end
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            local function gitsigns_visual_op(op)
                return function()
                    return require('gitsigns')[op]({ vim.fn.line("."), vim.fn.line("v") })
                end
            end

            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local opts = { buffer = bufnr }
                    vim.keymap.set('n', '<leader>o', gs.diffthis, opts)
                    vim.keymap.set("n", "<leader>n", gs.next_hunk, opts)
                    vim.keymap.set("n", "<leader>p", gs.prev_hunk, opts)
                    vim.keymap.set('n', '<leader>lb', gs.toggle_current_line_blame, opts)
                    vim.keymap.set('n', '<leader>ld', gs.toggle_deleted, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ls', gs.stage_hunk, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>lr', gs.reset_hunk, opts)
                    vim.keymap.set('n', '<leader>lu', gs.undo_stage_hunk, opts)
                    vim.keymap.set({'n', 'v'}, '<leader>ll', gitsigns_visual_op"stage_hunk", opts)
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

    -- Use kitty overlay
    use {
        'kdheepak/lazygit.nvim',
        config = function()
        end
    }

    use 'dstein64/vim-startuptime'

    use {
        'ggandor/leap.nvim',
        requires = { 'ggandor/leap-ast.nvim' },
        config = function()
            require 'leap'.setup {
            }
        end
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

    use { 'tmsvg/pear-tree',
        config = function()
            vim.g.pear_tree_repeatable_expand = 0
            vim.g.pear_tree_map_special_keys = 0
        end
    }

    use {
        'zegervdv/nrpattern.nvim',
        config = function()
            require "nrpattern".setup()
        end,
    }

    use 'tpope/vim-surround'

    use 'tpope/vim-repeat'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { { 'kyazdani42/nvim-web-devicons', opt = true },
        },
        config = function()
            require 'plugins.lualine'
        end
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            local trouble = require("trouble")
            trouble.setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            trouble.next({ skip_groups = true, jump = true })
            trouble.previous({ skip_groups = true, jump = true })
        end
    }

    use { 'mbbill/undotree',
        config = function()
            if vim.fn.has("persistent_undo") then
                local target_path = vim.fn.expand('~/.undodir')

                if not vim.fn.isdirectory(target_path) ~= 0 then
                    vim.fn.mkdir(target_path, "p", 0700)
                end
                vim.opt.undodir = target_path
            end

        end
    }

    use {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
        end
    }

    use 'christoomey/vim-tmux-navigator'

    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-t>]],
                size = 40,
                shell = "fish"
            })
        end
    }



    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    }

    use {
        'lewis6991/impatient.nvim',
        config = function()
            require 'impatient'.enable_profile()
        end
    }

    use 'skywind3000/asyncrun.vim'

    -- use {
    --     'simrat39/rust-tools.nvim',
    --     config = function()
    --         require 'rust-tools'.setup()
    --     end
    -- }


    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.cmd [[ highlight IndentBlanklineChar guifg=#292929 gui=nocombine ]]
            vim.cmd [[ highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine ]]
            require 'indent_blankline'.setup {
                show_trailing_blankline_indent = true,
                space_char_blankline = " ",
                show_current_context = true,
                -- show_current_context_start = true,
            }
        end
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        'renerocksai/telekasten.nvim',
        --[[ cmd = "Telekasten", ]]
        config = function()
            local home = vim.fn.expand("~/notes/notes/drafts")
            require 'telekasten'.setup {
                home = home,
                take_over_my_home = true
            }
        end
    }


    ---------------------------------------------------------------------------
    -- COLOR SCHEME
    ---------------------------------------------------------------------------

    -- use {
    --     'ishan9299/modus-theme-vim',
    --     requires = {
    --         'tjdevries/colorbuddy.nvim'
    --     }
    -- }
    -- Or with configuration

    -- use {
    --     'shaunsingh/oxocarbon.nvim',
    --     run = './install.sh',
    --     config = function()
    --         vim.cmd [[ colorscheme oxocarbon ]]
    --     end
    -- }

    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                theme_style = "dark_default",
                sidebars = { "qf", "packer", "terminal", "trouble" },
                colors = {
                    bg_search      = "#163356",
                    bg             = '#0d1117',
                    -- bg_highlight = "orange",
                    cursor_line_nr = "#FFEA00"
                },
                overrides = function(c)
                    return {
                        ColorColumn = { bg = "#2a2a2a" },
                        -- Whitespace = { fg = util.lighten(c.syntax.comment, 0.4) },
                        Whitespace = { fg = "red" },
                        TreesitterContext = { bg = '#212e3f' }
                    }
                end,
                dark_float = true,
                dark_sidebar = true,
            })
        end
    })

    -- use {
    --     "catppuccin/nvim",
    --     as = "catppuccin",
    --     config = function()
    --         vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    --         require 'catppuccin'.setup({
    --             integrations = {
    --                 navic = true,
    --                 indent_blankline = {
    --                     enabled = true,
    --                     colored_indent_levels = true,
    --                 },
    --                 ts_rainbow = true,
    --                 lsp_saga = true,
    --                 nvimtree = {
    --                     enabled = false
    --                 },
    --                 dashboard = false,
    --                 bufferline = false,
    --                 notify = false,
    --                 telekasten = false,
    --                 symbols_outline = false,
    --                 vimwiki = false,
    --                 beacon = false,
    --             }
    --         })
    --         vim.cmd [[ colorscheme catppuccin ]]
    --     end
    -- }



    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
