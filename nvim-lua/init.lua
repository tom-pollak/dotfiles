local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()

    use { 'NLKNguyen/papercolor-theme' }

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
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'dstein64/vim-startuptime'
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        requires = { { 'JoosepAlviste/nvim-ts-context-commentstring' } }
    }

    use {
        'tmsvg/pear-tree',
    }

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
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require"nvim-tree".setup {
                hijack_netrw = true,
                hijack_cursor = true,
                view = {
                    mappings = {
                        list = {
                            { key = "<CR>", action = "edit_in_place" }
                        }
                    }
                },
            }
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('colors')
require('base')
require('mappings')
require('plugins')
