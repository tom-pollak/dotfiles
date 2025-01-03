------------
-- NEOVIM --
------------

local set = vim.opt
local keymap = vim.keymap.set
local wo = vim.wo
local g = vim.g

-- Settings
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
set.cursorline = true
set.termguicolors = true
set.lazyredraw = true
set.pumheight = 12
set.linebreak = true
set.completeopt = "menu,menuone,noselect"
set.signcolumn = "yes"
set.jumpoptions = "stack"
set.linebreak = true
set.showmode = false
set.wildignore = {
	"*/cache/*",
	"*/tmp/*",
	"*/venv/*",
	"*/node_modules/*",
	"*/.git/*",
}

-- disable add auto comment
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

set.background = "dark"
wo.colorcolumn = "80"
set.mouse = "a"

vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() == "n" then
      vim.fn.matchadd("ExtraWhitespace", "\\s\\+$")
      vim.cmd("highlight ExtraWhitespace ctermbg=22 guibg=#9575CD")
    end
  end
})

vim.api.nvim_create_autocmd({"InsertEnter"}, {
  pattern = "*",
  callback = function()
    vim.fn.clearmatches()
  end
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("ExtraWhitespace", "\\s\\+$")
  end
})

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
	vim.cmd([[call append(line("."), repeat([""], v:count1))]])
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
	{ "tpope/vim-surround" },
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
					map("n", "<leader>ld", gitsigns.toggle_deleted)
				end,
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-l>"] = function()
								vim.cmd("stopinsert")
							end,
						},
						n = {
							["<esc>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			})

			local root_dir = function()
				local gitdir = require("plenary.job")
					:new({
						command = "git",
						args = { "rev-parse", "--show-toplevel" },
					})
					:sync()[1]
				if gitdir ~= nil then
					return gitdir
				end

				return vim.fn.getcwd()
			end

			local builtin = require("telescope.builtin")
			keymap("n", "<c-b>", function()
				builtin.buffers({ sort_lastused = true, sort_mru = true, ignore_current_buffer = true })
			end)
			keymap("n", "<c-p>", function()
				builtin.find_files({
					sort_lastused = true,
					sort_mru = true,
					ignore_current_buffer = true,
					cwd = root_dir(),
				})
			end)
			keymap("n", "<leader>cc", function()
				builtin.find_files({ prompt_title = "< Dotfiles >", cwd = "$HOME/.dotfiles" })
			end)
			keymap("n", "<leader>f", function()
				builtin.live_grep({ cwd = root_dir(), disable_coordinates = true })
			end)
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
		version = "v7.1.0", -- last supported 0.9.0
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
				markdown = { "mdformat" },
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
})
