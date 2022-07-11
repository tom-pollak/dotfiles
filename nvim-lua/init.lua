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
                    ['<C-n>'] = cmp.mapping.scroll_docs(4),
                    ['<C-p>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
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
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
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

    -- use {
    --     'tpope/vim-vinegar'
    -- }



    -- use {
    --     'folke/trouble.nvim',
    --     requires = 'kyazdani42/nvim-web-devicons',
    --     config = function()
    --         require("trouble").setup {
    --             -- mode = "loclist"
    --             mode = "quickfix"
    --         }
    --     end
    -- }

    use 'NLKNguyen/papercolor-theme'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = "all",

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                rainbow = { -- dosen't work
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
                context_commentstring = {
                    enable = true
                }
            }
        end
    }

    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim'
        },
        config = function()
            require('neogit').setup {
                intergrations = {
                    diffview = true
                }
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use 'dstein64/vim-startuptime'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
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
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = { theme = 'PaperColor' }
            }
        end
    }

    use {
        'francoiscabrol/ranger.vim',
        requires = { 'rbgrouleff/bclose.vim' },
        config = function()
            vim.g.ranger_replace_netrw = 1
        end
    }

    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = {
    --         'kyazdani42/nvim-web-devicons', -- optional, for file icons
    --     },
    --     config = function()
    --         require"nvim-tree".setup ({
    --             hijack_netrw = true,
    --             hijack_cursor = true,
    --             open_on_setup = true,
    --             hijack_unnamed_buffer_when_opening = true,
    --             view = {
    --                 mappings = {
    --                     list = {
    --                         { key = "<CR>", action = "edit_in_place" },
    --                         { key = "l", action = "edit_in_place" },
    --                         { key = "h", action = "dir_up" }
    --                     }
    --                 }
    --             },
    --         })
    --     end
    -- }

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

    use 'christoomey/vim-tmux-navigator'

    use 'p00f/clangd_extensions.nvim'

    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-t>]],
                size = 50,
            })
        end }

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

require('colors')
require('base')
require('mappings')
require('plugins')
