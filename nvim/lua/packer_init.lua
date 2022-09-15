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
        'neovim/nvim-lspconfig',
        requires = { 'williamboman/nvim-lsp-installer' },
        cond = not vim.g.minimal,
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
        "ray-x/lsp_signature.nvim",
        cond = not vim.g.minimal,
        config = function()
            require "lsp_signature".setup {
                toggle_key = "<C-y>",
                hint_prefix = ""
            }
        end
    }

    use {
        'kosayoda/nvim-lightbulb',
        cond = not vim.g.minimal,
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

    ---------------------------------------------------------------------------
    -- CODE
    ---------------------------------------------------------------------------

    use {
        'hrsh7th/nvim-cmp',
        cond = not vim.g.minimal,
        requires = {
            -- 'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rcarriga/cmp-dap'

            -- 'hrsh7th/cmp-cmdline',
        },
        config = function()
            require 'extensions.cmp-setup'
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'p00f/nvim-ts-rainbow' },
            { 'JoosepAlviste/nvim-ts-context-commentstring' },
            { 'nvim-treesitter/nvim-treesitter-context', bang = true },
            { 'andymass/vim-matchup' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', bang = true }
        },
        config = function()
            require 'extensions.treesitter-setup'
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
        cond = not vim.g.minimal,
        config = function()
            vim.g.pear_tree_repeatable_expand = 0
            vim.g.pear_tree_map_special_keys = 0
        end
    }

    use {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_enabled = false
            vim.g.copilot_filetypes = { "python", "lua", "cc", "rust" }
        end
    }

    use {
        'averms/black-nvim',
        cond = not vim.g.minimal,
    }

    use {
        'stsewd/isort.nvim',
        cond = not vim.g.minimal,
    }

    use {
        'simrat39/rust-tools.nvim',
        cond = not vim.g.minimal,
        config = function()
            local rt = require 'rust-tools'
            -- Update this path
            local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/'
            local codelldb_path = extension_path .. 'adapter/codelldb'
            local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

            local opts = {
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                dap = {
                    adapter = require('rust-tools.dap').get_codelldb_adapter(
                        codelldb_path, liblldb_path)
                },
                server = {
                    on_attach = function(client, bufnr)
                        require 'extensions.lsp-attach'.on_attach(client, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "ga", rt.code_action_group.code_action_group, { buffer = bufnr })
                        vim.keymap.set("n", "ga", rt.code_action_group.code_action_group, { buffer = bufnr })
                        -- Gives errors
                        --[[ vim.keymap.set("n", "J", rt.join_lines.join_lines, { buffer = bufnr }) ]]

                    end,
                }
            }
            rt.setup(opts)
        end
    }

    -- -- Not that good
    -- use {
    --     'jubnzv/virtual-types.nvim',
    -- }

    ---------------------------------------------------------------------------
    -- GIT
    ---------------------------------------------------------------------------

    use {
        'lewis6991/gitsigns.nvim',
        cond = not vim.g.minimal,
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
                    vim.keymap.set({ 'n', 'v' }, '<leader>ll', gitsigns_visual_op "stage_hunk", opts)
                end
            }
        end
    }

    use {
        'rhysd/git-messenger.vim',
        cond = not vim.g.minimal,
        config = function()
            vim.g.git_messenger_always_into_popup = 1
            vim.g.git_messenger_no_default_mappings = 1
        end
    }

    use {
        'kdheepak/lazygit.nvim',
        cond = not vim.g.minimal,
        config = function()
            if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
                vim.env.GIT_EDITOR = [[nvr -cc split --remote-wait +'set bufhidden=wipe']]
            end
        end
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
            { 'nvim-telescope/telescope-dap.nvim' }
        },
        config = function()
            require 'extensions.telescope-setup'
        end
    }

    use {
        "folke/trouble.nvim",
        cond = not vim.g.minimal,
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

    use {
        'chentoast/marks.nvim',
        cond = not vim.g.minimal,
        config = function()
            require 'marks'.setup {
                default_mappings = false,
                bookmark_0 = {
                    sign = "⚑",
                },
                mappings = {
                    set_bookmark0 = "mm",
                    delete_bookmark = "dm",
                    delete_bookmark0 = "cm"
                }
            }
        end
    }

    --[[ use { ]]
    --[[     'ggandor/leap.nvim', ]]
    --[[     config = function() ]]
    --[[         require 'extensions.leap-ast' ]]
    --[[         require 'leap'.setup { ]]
    --[[         } ]]
    --[[     end ]]
    --[[ } ]]

    ---------------------------------------------------------------------------
    -- UTILS
    ---------------------------------------------------------------------------

    use 'dstein64/vim-startuptime'

    use {
        'zegervdv/nrpattern.nvim',
        config = function()
            require "nrpattern".setup()
        end,
    }

    --[[ use {
        'thirtythreeforty/lessspace.vim',
        config = function()
            vim.g.lessspace_blacklist = { 'diff', 'markdown', 'telescope' }
        end
    } ]]

    use {
        'rhysd/clever-f.vim',
        config = function()
            vim.g.clever_f_smart_case = 1
            vim.g.clever_f_across_no_line = 1
            vim.g.clever_f_chars_match_any_signs = ';'
        end
    }

    use 'tpope/vim-surround'

    use 'tpope/vim-repeat'

    use {
        'tpope/vim-dispatch',
        cond = not vim.g.vscode and not vim.g.minimal
    }

    use { 'mbbill/undotree',
        cond = not vim.g.minimal,
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

    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-t>]],
                size = 40,
                shell = "fish"
            })
        end
    }

    use {
        'andymass/vim-matchup',
        config = function()
            vim.g.loaded_matchit = 1
        end
    }

    use {
        'lewis6991/impatient.nvim',
        config = function()
            require 'impatient'.enable_profile()
        end
    }

    use {
        'skywind3000/asyncrun.vim',
        cond = not vim.g.minimal,
    }

    ---------------------------------------------------------------------------
    -- NOTES
    ---------------------------------------------------------------------------

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    --[[ use {
        'renerocksai/telekasten.nvim',
        config = function()
            local home = vim.fn.expand("~/notes/notes/drafts")
            require 'telekasten'.setup {
                home = home,
                take_over_my_home = true
            }
        end
    } ]]

    use({ 'jakewvincent/mkdnflow.nvim',
        --[[ rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
        config = function()
            require('mkdnflow').setup({
                mappings = {
                    MkdnEnter = {{'i', 'n', 'v'}, '<CR>'}
                }
            })
        end
    })

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
                    -- bg_highlight = "orange",
                    cursor_line_nr = "#FFEA00"
                },
                overrides = function(_)
                    return {
                        ColorColumn = { bg = "#292929" },
                        -- Whitespace = { fg = util.lighten(c.syntax.comment, #292929 0.4) },
                        Whitespace = { fg = "red" },
                        ExtraWhitespace = { ctermbg = "red", guibg = "red" },
                        TreesitterContext = { bg = '#212e3f' }
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
            vim.cmd [[ highlight ExtraWhitespace guifg=#C678DD gui=nocombine ]]
            require 'indent_blankline'.setup {
                show_trailing_blankline_indent = false,
                space_char_blankline = " ",
                show_current_context = true,
                -- show_current_context_start = true,
            }
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        cond = not vim.g.minimal,
        config = function()
            require 'colorizer'.setup()
        end
    }

    ---------------------------------------------------------------------------
    -- DEBUG
    ---------------------------------------------------------------------------

    use {
        'mfussenegger/nvim-dap',
        cond = not vim.g.minimal and vim.g.ide,
        requires = {
            'mfussenegger/nvim-dap-python',
            'theHamsta/nvim-dap-virtual-text',
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
            vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })
            require('extensions.dap-ui').setup()
            require("nvim-dap-virtual-text").setup()
            local dap_python = require('dap-python')
            dap_python.setup('/usr/local/bin/python3')
            dap_python.test_runner = 'pytest'

        end
    }

    use {
        "nvim-neotest/neotest",
        cond = not vim.g.minimal and vim.g.ide,
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            { "nvim-neotest/neotest-vim-test", requires = 'vim-test/vim-test' },
            "nvim-neotest/neotest-python",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-plenary"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    require("neotest-plenary"),
                    require("neotest-rust"),
                    require("neotest-vim-test")({
                        ignore_file_types = { "python", "lua", "rust" },
                    }),
                },
            })
        end
    }


    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end,
    config = {
        compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'plugin', 'packer_compiled.lua')
    } })
