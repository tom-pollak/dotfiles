local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

    use  'NLKNguyen/papercolor-theme'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'TimUntersberger/neogit',
        requires ={
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim'
        },
        config = function()
            require('neogit').setup{
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

    use  'tmsvg/pear-tree'

    use 'tpope/vim-surround'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup{
                options = {theme = 'PaperColor'}
            }
        end
    }

    use {
        'francoiscabrol/ranger.vim',
        requires = {'rbgrouleff/bclose.vim'},
        -- config = function()
        --     require"ranger.vim".setup {
        --         ranger_replace_netrw = 1
        --     }
        -- end
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
            require'qf_helper'.setup({
                  prefer_loclist = true,       -- Used for QNext/QPrev (see Commands below)
                  sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
                  quickfix = {
                    autoclose = true,          -- Autoclose qf if it's the only open window
                    default_bindings = true,   -- Set up recommended bindings in qf window
                    default_options = true,    -- Set recommended buffer and window options
                    max_height = 20,           -- Max qf height when using open() or toggle()
                    min_height = 6,            -- Min qf height when using open() or toggle()
                    track_location = 'cursor', -- Keep qf updated with your current location
                                               -- Use `true` to update position as well
                  },
                  loclist = {                  -- The same options, but for the loclist
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

    use 'p00f/clangd_extensions.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('colors')
require('base')
require('mappings')
require('plugins')
