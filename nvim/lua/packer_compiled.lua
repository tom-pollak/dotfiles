-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n§\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a€6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16€9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5€9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6€6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2€'\6\r\0X\a\1€'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\nŽ\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\6;#clever_f_chars_match_any_signs\28clever_f_across_no_line\24clever_f_smart_case\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\nó\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14filetypes\1\0\1\rmarkdown\2\15suggestion\1\0\0\vkeymap\1\0\a\fdecline\n<C-g>\tnext\n<C-.>\vaccept\n<C-l>\16accept_line\1\16accept_word\1\fdismiss\n<C-\\>\tprev\n<C-,>\1\0\2\17auto_trigger\2\fenabled\2\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nü\1\0\0\a\0\15\0 6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\6\0004\5\3\0009\6\4\0009\6\5\6>\6\1\5=\5\4\0044\5\3\0009\6\a\0009\6\b\6>\6\1\5=\5\a\0044\5\3\0009\6\t\0009\6\n\6>\6\1\5=\5\t\0044\5\3\0009\6\v\0009\6\f\6>\6\1\5=\5\v\4=\4\14\3B\1\2\1K\0\1\0\rfiletype\1\0\0\rprettier\rmarkdown\14luaformat\blua\frustfmt\trust\1\0\0\nblack\vpython\nsetup\14formatter\24formatter.filetypes\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-messenger.vim"] = {
    config = { "\27LJ\2\ns\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0&git_messenger_no_default_mappings$git_messenger_always_into_popup\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\n\\\0\1\3\0\5\0\0065\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1L\1\2\0\22TreesitterContext\1\0\1\abg\f#090c10\16ColorColumn\1\0\0\1\0\1\abg\f#292929ý\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\3\14bg_search\f#163356\19cursor_line_nr\f#FFEA00\abg\f#0d1117\rsidebars\1\5\0\0\aqf\vpacker\rterminal\ftrouble\1\0\3\17dark_sidebar\2\16theme_style\17dark_default\15dark_float\2\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n¡\3\0\1\t\0\21\00056\1\0\0009\1\1\0019\1\2\0015\2\3\0=\0\4\0026\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\t\0009\a\n\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\v\0009\a\f\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\r\0009\a\14\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\15\0009\a\16\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\17\0009\a\18\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\19\0009\a\20\1B\3\4\1K\0\1\0\17preview_hunk\15<leader>lp\19toggle_deleted\15<leader>ld\30toggle_current_line_blame\15<leader>lb\rdiffthis\15<leader>lo\14prev_hunk\14<leader>p\14next_hunk\14<leader>n\6n\bset\vkeymap\bvim\vbuffer\1\0\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÕ\2\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\4\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\31show_current_context_start\1\nsetup\21indent_blankline\frequireG highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine @ highlight IndentBlanklineChar guifg=#292929 gui=nocombine \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    config = { "\27LJ\2\n÷\1\0\0\3\0\v\2\0236\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\2\t\0\1\0X\0\v€6\0\0\0009\0\3\0009\0\6\0'\2\a\0B\0\2\2\t\0\1\0X\0\4€6\0\0\0009\0\b\0'\1\n\0=\1\t\0K\0\1\0006nvr -cc split --remote-wait +'set bufhidden=wipe'\15GIT_EDITOR\benv\bnvr\15executable\tnvim\bhas\afn+lazygit_floating_window_scaling_factor\6g\bvimÍ™³æ\fæÌ¹ÿ\3\2\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n6\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\tleap\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23extensions.lualine\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n¸\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\3\21delete_bookmark0\bdam\18set_bookmark0\acm\20delete_bookmark\adm\15bookmark_0\1\0\1\tsign\bâš‘\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["notepad.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/notepad.nvim",
    url = "/Users/tom/projects/notepad.nvim"
  },
  ["nrpattern.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nrpattern\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nrpattern.nvim",
    url = "https://github.com/zegervdv/nrpattern.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n«\1\0\0\4\0\v\0\0156\0\0\0009\0\1\0)\1d\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\16status_text\1\0\1\fenabled\2\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n—\2\0\0\b\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\v\0004\5\3\0005\6\b\0005\a\a\0=\a\t\6>\6\1\0055\6\n\0>\6\2\5=\5\f\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\1\0\2\vaction\16parent_node\bkey\6h\bkey\1\0\1\vaction\tedit\1\5\0\0\t<CR>\6o\18<2-LeftMouse>\6l\1\0\2\nwidth\3(\tside\nright\24update_focused_file\1\0\0\1\0\2\15update_cwd\2\venable\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 extensions.treesitter-setup\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["qf_helper.nvim"] = {
    config = { "\27LJ\2\nÇ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\floclist\1\0\6\19track_location\vcursor\15min_height\3\1\15max_height\3\n\20default_options\2\21default_bindings\2\14autoclose\2\rquickfix\1\0\6\19track_location\vcursor\15min_height\3\1\15max_height\3\n\20default_options\2\21default_bindings\2\14autoclose\2\1\0\2\25sort_lsp_diagnostics\2\19prefer_loclist\2\nsetup\14qf_helper\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/qf_helper.nvim",
    url = "https://github.com/stevearc/qf_helper.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nß\2\0\2\b\1\18\00046\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0\18\5\1\0B\2\3\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0-\6\0\0009\6\b\0069\6\b\0065\a\t\0=\1\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0-\6\0\0009\6\f\0069\6\f\0065\a\r\0=\1\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0-\6\0\0009\6\15\0069\6\15\0065\a\16\0=\1\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0-\6\0\0009\6\f\0069\6\f\0065\a\17\0=\1\n\aB\2\5\1K\0\1\0\0À\1\0\0\1\0\0\14runnables\15<leader>dd\1\0\0\22code_action_group\aga\vbuffer\1\0\0\18hover_actions\6K\6n\bset\vkeymap\bvim\14on_attach\26extensions.lsp-attach\frequireÑ\2\1\0\a\0\18\0\0236\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\3\0003\3\4\0=\3\5\0025\3\r\0005\4\6\0005\5\a\0005\6\b\0=\6\t\5=\5\n\0045\5\v\0=\5\f\4=\4\14\3=\3\15\2=\2\16\0019\2\17\0\18\4\1\0B\2\2\0012\0\0€K\0\1\0\nsetup\vserver\rsettings\18rust-analyzer\1\0\0\15inlayHints\1\0\1\18locationLinks\1\ncheck\14extraArgs\1\4\0\0\a--\a-W\16clippy::all\1\0\1\fcommand\vclippy\1\0\1\16checkOnSave\2\14on_attach\0\1\0\1\15standalone\2\1\0\2\23other_hints_prefix\b=> \27parameter_hints_prefix\b<- \15rust-tools\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\31extensions.telescope-setup\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\nshell\tfish\tsize\3\25\17open_mapping\n<C-t>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n‹\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\1K\0\1\0\1\0\2\tjump\2\16skip_groups\2\rprevious\1\0\2\tjump\2\16skip_groups\2\tnext\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 surround_no_insert_mappings\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-surround
time([[Config for vim-surround]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 surround_no_insert_mappings\6g\bvim\0", "config", "vim-surround")
time([[Config for vim-surround]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n§\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a€6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16€9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5€9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6€6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2€'\6\r\0X\a\1€'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23extensions.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n—\2\0\0\b\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\v\0004\5\3\0005\6\b\0005\a\a\0=\a\t\6>\6\1\0055\6\n\0>\6\2\5=\5\f\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\1\0\2\vaction\16parent_node\bkey\6h\bkey\1\0\1\vaction\tedit\1\5\0\0\t<CR>\6o\18<2-LeftMouse>\6l\1\0\2\nwidth\3(\tside\nright\24update_focused_file\1\0\0\1\0\2\15update_cwd\2\venable\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: git-messenger.vim
time([[Config for git-messenger.vim]], true)
try_loadstring("\27LJ\2\ns\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0&git_messenger_no_default_mappings$git_messenger_always_into_popup\6g\bvim\0", "config", "git-messenger.vim")
time([[Config for git-messenger.vim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¡\3\0\1\t\0\21\00056\1\0\0009\1\1\0019\1\2\0015\2\3\0=\0\4\0026\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\t\0009\a\n\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\v\0009\a\f\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\r\0009\a\14\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\15\0009\a\16\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\17\0009\a\18\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\19\0009\a\20\1B\3\4\1K\0\1\0\17preview_hunk\15<leader>lp\19toggle_deleted\15<leader>ld\30toggle_current_line_blame\15<leader>lb\rdiffthis\15<leader>lo\14prev_hunk\14<leader>p\14next_hunk\14<leader>n\6n\bset\vkeymap\bvim\vbuffer\1\0\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 extensions.treesitter-setup\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\n\\\0\1\3\0\5\0\0065\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1L\1\2\0\22TreesitterContext\1\0\1\abg\f#090c10\16ColorColumn\1\0\0\1\0\1\abg\f#292929ý\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\3\14bg_search\f#163356\19cursor_line_nr\f#FFEA00\abg\f#0d1117\rsidebars\1\5\0\0\aqf\vpacker\rterminal\ftrouble\1\0\3\17dark_sidebar\2\16theme_style\17dark_default\15dark_float\2\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\nshell\tfish\tsize\3\25\17open_mapping\n<C-t>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n«\1\0\0\4\0\v\0\0156\0\0\0009\0\1\0)\1d\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\16status_text\1\0\1\fenabled\2\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\26cursorhold_updatetime\6g\bvim\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\31extensions.telescope-setup\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n‹\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\1K\0\1\0\1\0\2\tjump\2\16skip_groups\2\rprevious\1\0\2\tjump\2\16skip_groups\2\tnext\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nrpattern.nvim
time([[Config for nrpattern.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nrpattern\frequire\0", "config", "nrpattern.nvim")
time([[Config for nrpattern.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÕ\2\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\4\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\31show_current_context_start\1\nsetup\21indent_blankline\frequireG highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine @ highlight IndentBlanklineChar guifg=#292929 gui=nocombine \bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: lazygit.nvim
time([[Config for lazygit.nvim]], true)
try_loadstring("\27LJ\2\n÷\1\0\0\3\0\v\2\0236\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\2\t\0\1\0X\0\v€6\0\0\0009\0\3\0009\0\6\0'\2\a\0B\0\2\2\t\0\1\0X\0\4€6\0\0\0009\0\b\0'\1\n\0=\1\t\0K\0\1\0006nvr -cc split --remote-wait +'set bufhidden=wipe'\15GIT_EDITOR\benv\bnvr\15executable\tnvim\bhas\afn+lazygit_floating_window_scaling_factor\6g\bvimÍ™³æ\fæÌ¹ÿ\3\2\0", "config", "lazygit.nvim")
time([[Config for lazygit.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nü\1\0\0\a\0\15\0 6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\6\0004\5\3\0009\6\4\0009\6\5\6>\6\1\5=\5\4\0044\5\3\0009\6\a\0009\6\b\6>\6\1\5=\5\a\0044\5\3\0009\6\t\0009\6\n\6>\6\1\5=\5\t\0044\5\3\0009\6\v\0009\6\f\6>\6\1\5=\5\v\4=\4\14\3B\1\2\1K\0\1\0\rfiletype\1\0\0\rprettier\rmarkdown\14luaformat\blua\frustfmt\trust\1\0\0\nblack\vpython\nsetup\14formatter\24formatter.filetypes\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\3\21delete_bookmark0\bdam\18set_bookmark0\acm\20delete_bookmark\adm\15bookmark_0\1\0\1\tsign\bâš‘\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: clever-f.vim
time([[Config for clever-f.vim]], true)
try_loadstring("\27LJ\2\nŽ\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\6;#clever_f_chars_match_any_signs\28clever_f_across_no_line\24clever_f_smart_case\6g\bvim\0", "config", "clever-f.vim")
time([[Config for clever-f.vim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: qf_helper.nvim
time([[Config for qf_helper.nvim]], true)
try_loadstring("\27LJ\2\nÇ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\floclist\1\0\6\19track_location\vcursor\15min_height\3\1\15max_height\3\n\20default_options\2\21default_bindings\2\14autoclose\2\rquickfix\1\0\6\19track_location\vcursor\15min_height\3\1\15max_height\3\n\20default_options\2\21default_bindings\2\14autoclose\2\1\0\2\25sort_lsp_diagnostics\2\19prefer_loclist\2\nsetup\14qf_helper\frequire\0", "config", "qf_helper.nvim")
time([[Config for qf_helper.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason-lspconfig.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rs ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
