local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    -- LSP
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('nvim-lsp-installer').setup({
                automatic_installation = true
            })
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("nvim-lsp-installer").setup {
                automatic_installation = true
            }
        end
    }

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                rename_action_quit = "<esc>",
                code_action_keys = {
                    quit = "<esc>",
                    exec = "<cr>"
                },
                finder_action_keys = {
                    quit = "<esc>",
                    open = "<cr>",
                    vsplit = "<c-v>",
                    split = "<c-s>",
                    scroll_down = "<c-.>",
                    scroll_up = "<c-,>"
                }
            })
        end,
    })

    -- Not that good
    use {
        'jubnzv/virtual-types.nvim',
    }

    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup {}
        end
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- 'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip'
            -- 'hrsh7th/cmp-cmdline',
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-;>'] = cmp.mapping.scroll_docs(4),
                    ["<C-'>"] = cmp.mapping.scroll_docs(-4),
                    ['<C-space>'] = cmp.mapping.complete(),
                    ['<C-g>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- if cmp.visible() then
                        --     cmp.select_next_item()
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-e>"] = cmp.mapping(function(fallback)
                        cmp.mapping.abort()
                        local copilot_keys = vim.fn["copilot#Accept"]()
                        if copilot_keys ~= "" then
                            vim.api.nvim_feedkeys(copilot_keys, "i", true)
                        else
                            fallback()
                        end
                    end, { "i", "s" })
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp', max_item_count = 15 },
                    { name = 'luasnip', max_item_count = 5 }, -- For luasnip users.
                    { name = "nvim_lsp_signature_help" },
                    -- { name = 'buffer' },
                }),
                -- filetype = ('gitcommit', {
                --     sources = cmp.config.sources({
                --         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                --     }, {
                --         { name = 'buffer' },
                --     })
                -- })
            })

            -- Set configuration for specific filetype.
        end
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons', opt = true }
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup {
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
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'p00f/nvim-ts-rainbow' },
            { 'JoosepAlviste/nvim-ts-context-commentstring' }
        },
        config = function()
            -- vim.opt.foldmethod="expr"
            -- vim.opt.foldexpr=nvim_treesitter#foldexpr()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = "all",
                sync_install = false,
                -- indent = {
                --     enable = true,
                -- },
                highlight = {
                    enable = true,
                },
                rainbow = { -- dosen't work
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false
                }
            }
        end
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Use kitty overlay
    -- use {
    --     'kdheepak/lazygit.nvim',
    --     config = function()
    --     end
    -- }

    use 'dstein64/vim-startuptime'

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

    use 'tpope/vim-surround'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { { 'kyazdani42/nvim-web-devicons', opt = true },
            {
                "SmiteshP/nvim-navic", requires = { "neovim/nvim-lspconfig" },
                config = function()
                    vim.g.navic_silence = true
                end
            }, { 'projekt0n/github-nvim-theme' } },
        config = function()
            local navic = require "nvim-navic"

            require('lualine').setup {
                options = { theme = 'github_dark_default' },
                -- options = { theme = 'tokyonight' },
                sections = {
                    lualine_c = {
                        { 'filename', path = 1 },
                    },
                    lualine_y = { 'filetype' },
                    lualine_x = {
                        { navic.get_location, cond = navic.is_available },
                    }
                }
            }
        end
    }

    use {
        'francoiscabrol/ranger.vim',
        requires = { 'rbgrouleff/bclose.vim' },
        config = function()
            vim.g.ranger_replace_netrw = 1
            vim.g.ranger_map_keys = 0
        end
    }

    -- Perhaps use trouble?
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
                    max_height = 20, -- Max qf height when using open() or toggle()
                    min_height = 6, -- Min qf height when using open() or toggle()
                    track_location = 'cursor', -- Keep qf updated with your current location
                    -- Use `true` to update position as well
                },
                loclist = { -- The same options, but for the loclist
                    autoclose = true,
                    default_bindings = true,
                    default_options = true,
                    max_height = 20,
                    min_height = 6,
                    track_location = 'cursor',
                },
            })
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
                size = 50,
                shell = "fish"
            })
        end
    }


    -- use {
    --     'ishan9299/modus-theme-vim',
    --     requires = {
    --         'tjdevries/colorbuddy.nvim'
    --     }
    -- }
    -- Or with configuration

    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                theme_style = "dark_default",
                sidebars = { "qf", "packer", "terminal" },
                colors = {
                    bg_search = "#163356",
                    -- bg_highlight = "orange",
                    cursor_line_nr = "#FFEA00"
                },
                overrides = function(c)
                    return {
                        ColorColumn = { bg = "#2a2a2a" },
                        -- Whitespace = { fg = util.lighten(c.syntax.comment, 0.4) },
                        Whitespace = { fg = "red" },
                    }
                end
                -- dark_float = true,
            })
        end
    })

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    }

    use {
        'lewis6991/impatient.nvim',
        config = function ()
            require'impatient'.enable_profile()
        end
    }


    -- use {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function ()
    --         require 'indent-blankline'.setup{
    --         }
    --     end
    -- }

    -- use {
    --     'folke/tokyonight.nvim',
    --     config = function()
    --         vim.o.background = "dark"
    --         vim.g.tokyonight_style = "night"
    --         vim.cmd [[colorscheme tokyonight]]
    --     end
    -- }

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
