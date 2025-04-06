------------
-- NEOVIM --
------------

local set = vim.opt
local keymap = vim.keymap.set
local wo = vim.wo
local g = vim.g

-- Settings

g.have_nerd_font = true

set.background = "dark"
set.shell = "bash"
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.encoding = "utf-8"
set.wrap = false
set.scrolloff = 10
set.undofile = true
set.hidden = true
set.mouse = "a"
set.cursorline = true
set.termguicolors = true
set.lazyredraw = true
set.pumheight = 12
set.linebreak = true
set.completeopt = "menu,menuone,noselect"
set.signcolumn = "yes"
set.updatetime = 10
-- set.timeoutlen = 1000
set.jumpoptions = "stack"
set.linebreak = true
set.breakindent = true
set.showmode = false
set.splitright = true
set.splitbelow = true
set.wildignore = {
	"*/cache/*",
	"*/tmp/*",
	"*/venv/*",
	"*/node_modules/*",
	"*/.git/*",
}
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"

wo.colorcolumn = "80"

-- disable add auto comment
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	pattern = "*",
	callback = function()
		if vim.fn.mode() == "n" then
			vim.fn.matchadd("ExtraWhitespace", "\\s\\+$")
			vim.cmd("highlight ExtraWhitespace ctermbg=22 guibg=#9575CD")
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	pattern = "*",
	callback = function()
		vim.fn.clearmatches()
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = "*",
	callback = function()
		vim.fn.matchadd("ExtraWhitespace", "\\s\\+$")
	end,
})

-- Change directory
vim.api.nvim_create_user_command("CDC", "cd %:p:h", {})

keymap("t", "<Esc><Esc>", "<C-\\><C-n>")

keymap("n", "<leader>m", vim.diagnostic.setloclist)
keymap("n", "gj", vim.diagnostic.goto_next)
keymap("n", "gk", vim.diagnostic.goto_prev)

-- Change windows
keymap("n", "<C-h>", "<CMD>wincmd h<CR>")
keymap("n", "<C-j>", "<CMD>wincmd j<CR>")
keymap("n", "<C-k>", "<CMD>wincmd k<CR>")
keymap("n", "<C-l>", "<CMD>wincmd l<CR>")

keymap("n", "n", "nzz", { silent = true })
keymap("n", "N", "Nzz", { silent = true })
keymap("n", "*", "*zz", { silent = true })

keymap("n", "<C-d>", "<C-d>zz", { silent = true })
keymap("n", "<C-u>", "<C-u>zz", { silent = true })

keymap({ "n" }, "<CR>", function()
	if not vim.bo.modifiable then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
	else
		vim.cmd([[call append(line("."), repeat([""], v:count1))]])
	end
end)

-- j k keys in jump list
keymap({ "n", "x" }, "j", function()
	if vim.v.count == 0 then
		return "gj"
	elseif vim.v.count > 5 then
		return "m'" .. vim.v.count .. "j"
	else
		return vim.v.count .. "j"
	end
end, { noremap = true, expr = true })
keymap({ "n", "x" }, "k", function()
	if vim.v.count == 0 then
		return "gk"
	elseif vim.v.count > 5 then
		return "m'" .. vim.v.count .. "k"
	else
		return vim.v.count .. "k"
	end
end, { noremap = true, expr = true })

-- Toggle notes
keymap("n", "<C-7>", function()
	local notes_file = vim.fn.expand("$HOME/fun/notes/notes.md")
	if vim.fn.expand("%:p") == notes_file then
		vim.cmd("b#")
	else
		vim.cmd("e " .. notes_file)
	end
end)

-- cd around
keymap("n", "<C-f>", function()
	return ":e " .. vim.fn.expand("%:p:h") .. "/"
end, { expr = true })

-- Expand path (:cd %%)
keymap("c", "%%", function()
	if vim.fn.getcmdtype() == ":" then
		return vim.fn.expand("%:h") .. "/"
	else
		return "%%"
	end
end, { expr = true })

vim.keymap.set("n", "<leader>k", function()
	local has_loc_list = #vim.fn.getloclist(0) > 0
	local winid = vim.fn.getloclist(0, { winid = 0 }).winid

	if winid == 0 then
		if has_loc_list then
			vim.cmd("lopen")
		else
			vim.notify("No location list")
		end
	else
		vim.cmd("lclose")
	end
end, { noremap = true, silent = true })

vim.keymap.set("n", "gq", function()
	local lspconfig = require("lspconfig")
	local clients = vim.lsp.get_clients()
	local servers = lspconfig.util.available_servers()

	-- Check if we have any active clients to determine current state
	if vim.tbl_isempty(clients) then
		vim.cmd("LspStart")
		vim.notify("LSP enabled globally", vim.log.levels.INFO)
	else
		for _, client in pairs(clients) do
			client.stop()
		end
		vim.notify("LSP disabled globally", vim.log.levels.INFO)
	end
end)

-- Plugins --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ "tpope/vim-surround" },

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			indent = { enabled = true },
			explorer = { enabled = true },
			input = { enabled = true },
			picker = {
				enabled = true,
				win = {
					input = {
						keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } },
					},
				},
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			words = { enabled = true },
			scratch = { enabled = true },
			lazygit = { enabled = true },
			gitbrowse = { enabled = true },
			terminal = { enabled = true },
		},
        -- stylua: ignore start
		keys = {
            -- pickers
			{ "<C-p>", function() Snacks.picker.smart() end },
			{ "<C-b>", function() Snacks.picker.buffers({ current = false }) end },
			{ "<leader>a", function() Snacks.picker.resume() end },
			{ "<leader>f", function() Snacks.picker.grep() end },
			{ "<leader>cc", function() Snacks.picker.files({ cwd = vim.fn.expand("$HOME/.dotfiles/") }) end, desc = "Find Config File" },

            -- quickfix
            { "<leader>qq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
            { "<leader>ql", function() Snacks.picker.loclist() end, desc = "Location List" },

            -- explorer
			{ "<leader>t", function() Snacks.explorer.open() end },

            -- terminal
            { "<c-'>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },

            -- lazygit
			{ "<leader>j", function() Snacks.lazygit.open() end },

            -- git
            { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
            { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },

            -- notifications
            { "gN",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
            { "gn", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

            -- lsp
            { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
            { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
            { "ge", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
            { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
            { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "<leader>s", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            { "<leader>S", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		},
		-- stylua: ignore end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		-- version = "v0.8.5.2", -- last support for v0.9.5
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = "all",
			indent = { enable = true },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "<leader>n", function()
						if vim.wo.diff then
							vim.cmd.normal({ "<leader>n", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "<leader>p", function()
						if vim.wo.diff then
							vim.cmd.normal({ "<leader>p", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)

					-- Actions
					map("n", "<leader>lc", function()
						gitsigns.blame_line({ full = true })
					end)
					map("n", "<leader>lb", gitsigns.toggle_current_line_blame)
					map("n", "<leader>lo", gitsigns.diffthis)
					map("n", "<leader>ld", gitsigns.preview_hunk_inline)
				end,
			})
		end,
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.comment").setup()
		end,
	},

	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.everforest_enable_italic = false
			vim.cmd.colorscheme("everforest")
		end,
	},

	{
		-- mouse scrolling
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-y>", "<C-e>" },
				respect_scrolloff = true,
				easing_function = "cubic",
			})
			keymap("n", "<ScrollWheelUp>", "<C-y>")
			keymap("n", "<ScrollWheelDown>", "<C-e>")
			keymap("i", "<ScrollWheelUp>", "<C-o><C-y>")
			keymap("i", "<ScrollWheelDown>", "<C-o><C-e>")
			keymap("v", "<ScrollWheelUp>", "<C-y>")
			keymap("v", "<ScrollWheelDown>", "<C-e>")
		end,
	},

	{
		"stevearc/conform.nvim",
		-- version = "v7.1.0", -- last supported 0.9.5
		opts = {
			formatters_by_ft = {
				python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
				markdown = { "markdownfmt" },
				lua = { "stylua" },
				["*"] = { "trim_whitespace", "codespell" },
			},
		},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>e",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp", -- autocomplete
			{ "j-hui/fidget.nvim", opts = {} }, -- status updates for LSP in bottom right
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("ga", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
			})

			-- Capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- ruff = {
				-- 	init_options = {
				-- 		settings = {
				-- 			logLevel = "debug",
				-- 		},
				-- 	},
				-- },
				pyright = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								autoImportCompletions = false,
								-- typeCheckingMode = "off",
								-- diagnosticMode = "off",
							},
							linting = {
								-- enabled = false,
							},
						},
					},
					-- handlers = {
					-- 	["textDocument/publishDiagnostics"] = function() end,
					-- },
				},
				-- rust_analyzer = {},

				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "none",
				["<C-f>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-l>"] = { "select_and_accept" },
				["<C-g>"] = { "hide" },

				["<C-k>"] = { "select_prev" },
				["<C-j>"] = { "select_next" },

				["<C-h>"] = { "show_signature", "hide_signature" },
				["<C-p>"] = { "scroll_documentation_up", "fallback" },
				["<C-n>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			-- Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			signature = { enabled = true },

			sources = { default = { "lsp", "path" } },

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	opts = {
	-- 		linters_by_ft = {},
	-- 		linters = {},
	-- 	},
	-- },
})
