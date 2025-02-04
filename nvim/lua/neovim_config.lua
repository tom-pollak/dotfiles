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
set.updatetime = 250
set.timeoutlen = 300
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
	-- Detect tabstop and shiftwidth automatically
	-- { 'tpope/vim-sleuth', },

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
		},
		keys = {
			{
				"<C-p>",
				function()
					Snacks.picker.smart()
				end,
			},
			{
				"<C-b>",
				function()
					Snacks.picker.buffers({ current = false })
				end,
			},

			{
				"<leader>r",
				function()
					Snacks.explorer.open()
				end,
			},
			{
				"<leader>a",
				function()
					Snacks.picker.resume()
				end,
			},
			{
				"<leader>f",
				function()
					Snacks.picker.grep()
				end,
			},
			{
				"<leader>cc",
				function()
					Snacks.picker.files({ cwd = vim.fn.expand("$HOME/.dotfiles/") })
				end,
				desc = "Find Config File",
			},
		},
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
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { { "<leader>j", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
	},

	{
		"stevearc/conform.nvim",
		-- version = "v7.1.0", -- last supported 0.9.5
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
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

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						desc = desc or ""
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local picker = require("snacks").picker
					map("gd", picker.lsp_definitions)
					map("gr", picker.lsp_references)
					map("<leader>s", picker.lsp_symbols)

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("ga", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- Highlight references
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			if vim.g.have_nerd_font then
				local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
				local diagnostic_signs = {}
				for type, icon in pairs(signs) do
					diagnostic_signs[vim.diagnostic.severity[type]] = icon
				end
				vim.diagnostic.config({ signs = { text = diagnostic_signs } })
			end

			local servers = {
				clangd = {},
				gopls = {},
				pyright = {},
				rust_analyzer = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				automatic_installation = true,
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

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-j>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-k>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-p>"] = cmp.mapping.scroll_docs(-4),
					["<C-n>"] = cmp.mapping.scroll_docs(4),

					["<C-l>"] = cmp.mapping.confirm({ select = true }),
					["<C-space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{
						name = "lazydev",
						-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "path" },
				},
			})
		end,
	},
})
