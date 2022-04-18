-- --[[
-- lvim is the global options object

-- Linters should be
-- filled in as strings with either
-- a global executable or a path to
-- an executable
-- ]]
-- -- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- -- general
lvim.colorscheme = "tokyonight"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true


local init_custom_options = function()
  local custom_options = {
    relativenumber = true,
    colorcolumn = "80",
    smartcase = true,
    ignorecase = true,
  }
  for k, v in pairs(custom_options) do
    vim.opt[k] = v
  end
end
init_custom_options()

-- -- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- *
-- keymappings
-- *

-- *
-- NORMAL
-- *

-- disable Ex mode, tf
lvim.keys.normal_mode["Q"] = false

-- window movement
lvim.keys.normal_mode["<A-h>"] = "<C-w>h"
lvim.keys.normal_mode["<A-j>"] = "<C-w>j"
lvim.keys.normal_mode["<A-k>"] = "<C-w>k"
lvim.keys.normal_mode["<A-l>"] = "<C-w>l"

-- resize with arrows
lvim.keys.normal_mode["<Up>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<Down>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<Left>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<Right>"] = ":vertical resize +2<CR>"

-- quickfix
lvim.keys.normal_mode["]q"] = ":cnext<CR>"
lvim.keys.normal_mode["[q"] = ":cprev<CR>"
lvim.keys.normal_mode["<C-q>"] = ":call QuickFixToggle()<CR>"

-- diagnostics
lvim.keys.normal_mode["gd"] = "<cmd>Trouble lsp_definitions<CR>"
lvim.keys.normal_mode["gD"] = "<cmd>Trouble lsp_references<CR>"

-- *
-- TERM
-- *

-- window movement
lvim.keys.term_mode["<A-h>"] = "<C-\\><C-N><C-w>h"
lvim.keys.term_mode["<A-j>"] = "<C-\\><C-N><C-w>j"
lvim.keys.term_mode["<A-k>"] = "<C-\\><C-N><C-w>k"
lvim.keys.term_mode["<A-l>"] = "<C-\\><C-N><C-w>l"

-- *
-- VISUAL
-- *

-- better indenting
lvim.keys.visual_mode["<"] = "<gv"
lvim.keys.visual_mode[">"] = ">gv"

-- lvim.keys.visual_mode = {

--         -- paste most recent yank
--         { "p", '"0p', { silent = true } },
--         { "P", '"0P', { silent = true } },
-- }


-- *
-- Telescope
-- *
lvim.builtin.telescope.active = true
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
local get_telescope_mappings = function()
  local actions = require("telescope.actions")
  return {
    i = {
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
      ["<C-c>"] = actions.close,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      ["<CR>"] = actions.select_default + actions.center,
      ["<c-x>"] = false,
    },
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    },
  }
end
lvim.builtin.telescope.defaults.mappings = get_telescope_mappings()


-- *
-- Dashboard
-- *
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.custom_section.a.command = "Telescope find_files find_command=rg,--ignore,--hidden,--files"

-- *
-- Terminal
-- *
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shading_factor = 1

-- *
-- Nvimtree
-- *
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1


-- *
-- Treesitter
-- *
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.ignore_install = { "phpdoc" }

-- *
-- Whichkey
-- *
lvim.builtin.which_key.active = true
lvim.builtin.which_key.mappings["w"] = { "<cmd>w<CR>", "Save" }
lvim.builtin.which_key.mappings["W"] = { "<cmd>w!<CR>", "Force Save" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<CR>", "Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<CR>", "Force Quit" }
-- lvim.builtin.which_key.mappings["f"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" }
lvim.builtin.which_key.mappings["b"]["c"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Current Buffer" }
lvim.builtin.which_key.mappings["s"]["s"] = {
  "<cmd>Telescope live_grep find_command=rg,--ignore,--hidden,--files<CR>",
  "Live Grep",
}
lvim.builtin.which_key.mappings["s"]["m"] = { "<cmd>Telescope marks<cr>", "Search Marks" }
lvim.builtin.which_key.mappings["s"]["g"] = { "<cmd>Telescope git_files<cr>", "Search Git Files" }
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  f = {
    "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>",
    "Find File",
  },
  b = {
    "<cmd>Telescope buffers find_command=rg,--ignore,--hidden,--files<CR>",
    "Find Buffer",
  }
}
lvim.builtin.which_key.mappings["t"] = {
  name = "Toggle",
  h = { "<cmd>set hlsearch!<CR>", "Toggle Highlight" },
  q = { "<cmd>call QuickFixToggle()<CR>", "Toggle Quick Fix List" },
  b = { "<cmd>GitBlameToggle<CR>", "Toggle Git Blame" },
  t = { "<cmd>Twilight<CR>", "Toggle Twilight" },
  i = { "<cmd>IndentBlanklineToggle<CR>", "Toggle Indent Line" },
  x = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
}
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" }
lvim.builtin.which_key.mappings["x"] = {
  name = "Trouble",
  w = { "<cmd>Trouble lsp_workspace_diagnostics<CR>", "Trouble Workspaces" },
  d = { "<cmd>Trouble document_diagnostics<CR>", "Trouble Document" },
  l = { "<cmd>Trouble loclist<CR>", "Trouble Location List" },
  q = { "<cmd>Trouble quickfix<CR>", "Trouble Quickfix List" },
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true




-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING
helpers.make_builtin({
  name = "stylish-haskell",
  meta = {
    url = "https://github.com/haskell/stylish-haskell",
    description = "Formatter for Haskell",
  },
  method = FORMATTING,
  filetypes = { "haskell" },
  generator_opts = {
    command = "",
    args = { "$FILENAME", "-" },
    to_stdin = true,
  },
  factory = helpers.formatter_factory,
})

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
  -- { command = "stylish-haskell", filetypes = { "haskell" } }
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python", "markdown" },
  }
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "night"
    end
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "document_diagnostics",
        action_keys = { -- key mappings for actions in the trouble list
          -- map to {} to remove a mapping, for example:
          -- close = {},
          close = "q", -- close the list
          cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r", -- manually refresh
          jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" }, -- open buffer in new split
          open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
          open_tab = { "<c-t>" }, -- open buffer in new tab
          jump_close = { "o" }, -- jump to the diagnostic and close the list
          toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = "P", -- toggle auto_preview
          hover = "K", -- opens a small popup with the full multiline message
          preview = "p", -- preview the diagnostic location
          close_folds = { "zM", "zm" }, -- close all folds
          open_folds = { "zR", "zr" }, -- open all folds
          toggle_fold = { "zA", "za" }, -- toggle fold of current file
          previous = "k", -- preview item
          next = "j", -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = true, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        lsp_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
      })
    end,
  },
  -- {
  --         "karb94/neoscroll.nvim",
  --         event = "BufRead",
  --         config = function()
  --                 require("neoscroll").setup({
  --                         -- All these keys will be mapped to their corresponding default scrolling animation
  --                         mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  --                         hide_cursor = true, -- Hide cursor while scrolling
  --                         stop_eof = true, -- Stop at <EOF> when scrolling downwards
  --                         use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  --                         respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --                         cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
  --                         easing_function = nil, -- Default easing function
  --                 })
  --         end,
  -- },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    event = "BufRead",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          height = 0.85, -- height of the Zen window
          options = {
            signcolumn = "no", -- disable signcolumn
            number = true, -- disable number column
            relativenumber = true, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
          },
        },
        plugins = {
          gitsigns = { enabled = false }, -- disables git signs
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufRead",
  },
  {
    "folke/twilight.nvim",
    event = "BufRead",
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
        },
        context = 20, -- amount of lines we will try to show around the current line
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      vim.g.indentLine_enabled = 1
      -- vim.g.indent_blankline_char = "‚ñè"
      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}


-- vim.opt.hightlight = "LineNr guifg=orange"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  { "BufWinEnter", "*.hs", "setlocal ts=4 sw=4" },
  { "BufWinEnter", "*", "highlight LineNr guifg=orange" }
}
