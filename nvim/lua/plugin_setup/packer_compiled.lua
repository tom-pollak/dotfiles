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
    config = { "\27LJ\2\n�\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a�6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16�9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5�9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6�6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2�'\6\r\0X\a\1�'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
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
  ["asyncrun.vim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["black-nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/black-nvim",
    url = "https://github.com/averms/black-nvim"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\6;#clever_f_chars_match_any_signs\28clever_f_across_no_line\24clever_f_smart_case\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-dap"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp-dap",
    url = "https://github.com/rcarriga/cmp-dap"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
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
  ["copilot.vim"] = {
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\5\0\0\vpython\blua\acc\trust\22copilot_filetypes\20copilot_enabled\26copilot_assume_mapped\23copilot_no_tab_map\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["git-messenger.vim"] = {
    cond = { true },
    config = { "\27LJ\2\ns\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0&git_messenger_no_default_mappings$git_messenger_always_into_popup\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\n�\1\0\1\3\0\t\0\n5\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\1L\1\2\0\22TreesitterContext\1\0\1\abg\f#212e3f\20ExtraWhitespace\1\0\2\fctermbg\bred\nguibg\bred\15Whitespace\1\0\1\afg\bred\16ColorColumn\1\0\0\1\0\1\abg\f#292929�\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\3\14bg_search\f#163356\abg\f#0d1117\19cursor_line_nr\f#FFEA00\rsidebars\1\5\0\0\aqf\vpacker\rterminal\ftrouble\1\0\3\16theme_style\17dark_default\17dark_sidebar\2\15dark_float\2\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    cond = { true },
    config = { "\27LJ\2\n|\0\0\6\1\a\1\0196\0\0\0'\2\1\0B\0\2\2-\1\0\0008\0\1\0004\2\3\0006\3\2\0009\3\3\0039\3\4\3'\5\5\0B\3\2\2>\3\1\0026\3\2\0009\3\3\0039\3\4\3'\5\6\0B\3\2\0?\3\0\0D\0\2\0\0�\6v\6.\tline\afn\bvim\rgitsigns\frequire\5����\4\20\1\1\2\0\1\0\0033\1\0\0002\0\0�L\1\2\0\0�\4\0\1\n\1\29\0P6\1\0\0009\1\1\0019\1\2\0015\2\3\0=\0\4\0026\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\t\0009\a\n\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\v\0009\a\f\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\r\0009\a\14\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\15\0009\a\16\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\17\0009\a\18\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\0035\5\19\0'\6\20\0009\a\21\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\0035\5\22\0'\6\23\0009\a\24\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\25\0009\a\26\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\0035\5\27\0'\6\28\0-\a\0\0'\t\21\0B\a\2\2\18\b\2\0B\3\5\1K\0\1\0\0�\15<leader>ll\1\3\0\0\6n\6v\20undo_stage_hunk\15<leader>lu\15reset_hunk\15<leader>lr\1\3\0\0\6n\6v\15stage_hunk\15<leader>ls\1\3\0\0\6n\6v\19toggle_deleted\15<leader>ld\30toggle_current_line_blame\15<leader>lb\14prev_hunk\14<leader>p\14next_hunk\14<leader>n\rdiffthis\14<leader>o\6n\bset\vkeymap\bvim\vbuffer\1\0\0\rgitsigns\vloaded\fpackageY\1\0\5\0\a\0\v3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0003\4\4\0=\4\6\3B\1\2\0012\0\0�K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\3\0\t\0\0196\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire< highlight ExtraWhitespace guifg=#C678DD gui=nocombine G highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine @ highlight IndentBlanklineChar guifg=#292929 gui=nocombine \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["isort.nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/isort.nvim",
    url = "https://github.com/stsewd/isort.nvim"
  },
  ["lazygit.nvim"] = {
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\3\0\t\1\0196\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\v�6\0\0\0009\0\1\0009\0\4\0'\2\5\0B\0\2\2\t\0\0\0X\0\4�6\0\0\0009\0\6\0'\1\b\0=\1\a\0K\0\1\0006nvr -cc split --remote-wait +'set bufhidden=wipe'\15GIT_EDITOR\benv\bnvr\15executable\tnvim\bhas\afn\bvim\2\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lsp_signature.nvim"] = {
    cond = { true },
    config = { "\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16hint_prefix\5\15toggle_key\n<C-y>\nsetup\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
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
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\3\18set_bookmark0\amm\21delete_bookmark0\acm\20delete_bookmark\adm\15bookmark_0\1\0\1\tsign\b⚑\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mkdnflow.nvim"] = {
    config = { "\27LJ\2\n\0\0\6\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0005\4\4\0005\5\3\0>\5\1\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\rmappings\1\0\0\14MkdnEnter\1\0\0\1\3\0\0\0\t<CR>\1\4\0\0\6i\6n\6v\nsetup\rmkdnflow\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n�\2\0\0\b\0\15\1!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0004\3\5\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0005\a\4\0=\a\6\6B\4\2\2>\4\1\0036\4\0\0'\6\a\0B\4\2\2>\4\2\0036\4\0\0'\6\b\0B\4\2\2>\4\3\0036\4\0\0'\6\t\0B\4\2\0025\6\v\0005\a\n\0=\a\f\6B\4\2\0?\4\0\0=\3\14\2B\0\2\1K\0\1\0\radapters\1\0\0\22ignore_file_types\1\0\0\1\4\0\0\vpython\blua\trust\21neotest-vim-test\17neotest-rust\20neotest-plenary\bdap\1\0\0\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\t����\4\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-plenary"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/neotest-plenary",
    url = "https://github.com/nvim-neotest/neotest-plenary"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["neotest-rust"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/neotest-rust",
    url = "https://github.com/rouge8/neotest-rust"
  },
  ["neotest-vim-test"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/neotest-vim-test",
    url = "https://github.com/nvim-neotest/neotest-vim-test"
  },
  ["nrpattern.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nrpattern\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nrpattern.nvim",
    url = "https://github.com/zegervdv/nrpattern.nvim"
  },
  ["nvim-cmp"] = {
    cond = { true },
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25extensions.cmp-setup\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    cond = { true },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\17\0%6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\t\0'\2\n\0B\0\2\0029\0\v\0B\0\1\0016\0\t\0'\2\f\0B\0\2\0029\0\v\0B\0\1\0016\0\t\0'\2\r\0B\0\2\0029\1\v\0'\3\14\0B\1\2\1'\1\16\0=\1\15\0K\0\1\0\vpytest\16test_runner\27/usr/local/bin/python3\15dap-python\26nvim-dap-virtual-text\nsetup\22extensions.dap-ui\frequire\1\0\4\nnumhl\5\ttext\v⭐️\vlinehl\5\vtexthl\5\15DapStopped\1\0\4\nnumhl\5\ttext\t🟦\vlinehl\5\vtexthl\5\26DapBreakpointRejected\1\0\4\nnumhl\5\ttext\t🟥\vlinehl\5\vtexthl\5\18DapBreakpoint\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lightbulb"] = {
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\4\0\v\0\0156\0\0\0009\0\1\0)\1d\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\16status_text\1\0\1\fenabled\2\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\26cursorhold_updatetime\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\5\0\0\18rust_analyzer\16sumneko_lua\vclangd\fpyright\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 extensions.treesitter-setup\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
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
  ["pear-tree"] = {
    cond = { true },
    config = { "\27LJ\2\nh\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\31pear_tree_map_special_keys pear_tree_repeatable_expand\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/pear-tree",
    url = "https://github.com/tmsvg/pear-tree"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    cond = { true },
    config = { "\27LJ\2\n�\2\0\2\b\1\15\0)6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0\18\5\1\0B\2\3\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0-\6\0\0009\6\b\0069\6\b\0065\a\t\0=\1\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0-\6\0\0009\6\f\0069\6\f\0065\a\r\0=\1\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0-\6\0\0009\6\f\0069\6\f\0065\a\14\0=\1\n\aB\2\5\1K\0\1\0\0�\1\0\0\1\0\0\22code_action_group\aga\vbuffer\1\0\0\18hover_actions\6K\6n\bset\vkeymap\bvim\14on_attach\26extensions.lsp-attach\frequire�\3\1\0\n\0\19\0\"6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\2\5\0&\1\2\1\18\2\1\0'\3\6\0&\2\3\2\18\3\1\0'\4\a\0&\3\4\0035\4\b\0005\5\v\0006\6\0\0'\b\t\0B\6\2\0029\6\n\6\18\b\2\0\18\t\3\0B\6\3\2=\6\f\5=\5\r\0045\5\15\0003\6\14\0=\6\16\5=\5\17\0049\5\18\0\18\a\4\0B\5\2\0012\0\0�K\0\1\0\nsetup\vserver\14on_attach\1\0\0\0\bdap\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\1\0\2\23other_hints_prefix\b=> \27parameter_hints_prefix\b<- \27lldb/lib/liblldb.dylib\21adapter/codelldb3/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/\tHOME\benv\bvim\15rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
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
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31extensions.telescope-setup\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\3(\17open_mapping\n<C-t>\nshell\tfish\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\1K\0\1\0\1\0\2\16skip_groups\2\tjump\2\rprevious\1\0\2\16skip_groups\2\tjump\2\tnext\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    cond = { true },
    config = { "\27LJ\2\n�\1\0\0\6\0\v\1\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\23�6\0\0\0009\0\1\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\0019\1\6\1\18\3\0\0B\1\2\2\19\1\1\0\b\1\0\0X\1\a�6\1\0\0009\1\1\0019\1\a\1\18\3\0\0'\4\b\0)\5�\2B\1\4\0016\1\0\0009\1\t\1=\0\n\1K\0\1\0\fundodir\bopt\6p\nmkdir\16isdirectory\15~/.undodir\vexpand\20persistent_undo\bhas\afn\bvim\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-dispatch"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\n0\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\19loaded_matchit\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
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
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\17\0%6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\t\0'\2\n\0B\0\2\0029\0\v\0B\0\1\0016\0\t\0'\2\f\0B\0\2\0029\0\v\0B\0\1\0016\0\t\0'\2\r\0B\0\2\0029\1\v\0'\3\14\0B\1\2\1'\1\16\0=\1\15\0K\0\1\0\vpytest\16test_runner\27/usr/local/bin/python3\15dap-python\26nvim-dap-virtual-text\nsetup\22extensions.dap-ui\frequire\1\0\4\nnumhl\5\ttext\v⭐️\vlinehl\5\vtexthl\5\15DapStopped\1\0\4\nnumhl\5\ttext\t🟦\vlinehl\5\vtexthl\5\26DapBreakpointRejected\1\0\4\nnumhl\5\ttext\t🟥\vlinehl\5\vtexthl\5\18DapBreakpoint\16sign_define\afn\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\3(\17open_mapping\n<C-t>\nshell\tfish\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\n�\1\0\1\3\0\t\0\n5\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\1L\1\2\0\22TreesitterContext\1\0\1\abg\f#212e3f\20ExtraWhitespace\1\0\2\fctermbg\bred\nguibg\bred\15Whitespace\1\0\1\afg\bred\16ColorColumn\1\0\0\1\0\1\abg\f#292929�\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\3\14bg_search\f#163356\abg\f#0d1117\19cursor_line_nr\f#FFEA00\rsidebars\1\5\0\0\aqf\vpacker\rterminal\ftrouble\1\0\3\16theme_style\17dark_default\17dark_sidebar\2\15dark_float\2\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: nrpattern.nvim
time([[Config for nrpattern.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nrpattern\frequire\0", "config", "nrpattern.nvim")
time([[Config for nrpattern.nvim]], false)
-- Config for: mkdnflow.nvim
time([[Config for mkdnflow.nvim]], true)
try_loadstring("\27LJ\2\n\0\0\6\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0005\4\4\0005\5\3\0>\5\1\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\rmappings\1\0\0\14MkdnEnter\1\0\0\1\3\0\0\0\t<CR>\1\4\0\0\6i\6n\6v\nsetup\rmkdnflow\frequire\0", "config", "mkdnflow.nvim")
time([[Config for mkdnflow.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: clever-f.vim
time([[Config for clever-f.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\6;#clever_f_chars_match_any_signs\28clever_f_across_no_line\24clever_f_smart_case\6g\bvim\0", "config", "clever-f.vim")
time([[Config for clever-f.vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 extensions.treesitter-setup\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\n0\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\19loaded_matchit\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23extensions.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\3\0\t\0\0196\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire< highlight ExtraWhitespace guifg=#C678DD gui=nocombine G highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine @ highlight IndentBlanklineChar guifg=#292929 gui=nocombine \bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a�6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16�9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5�9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6�6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2�'\6\r\0X\a\1�'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31extensions.telescope-setup\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n�\2\0\0\b\0\15\1!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0004\3\5\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0005\a\4\0=\a\6\6B\4\2\2>\4\1\0036\4\0\0'\6\a\0B\4\2\2>\4\2\0036\4\0\0'\6\b\0B\4\2\2>\4\3\0036\4\0\0'\6\t\0B\4\2\0025\6\v\0005\a\n\0=\a\f\6B\4\2\0?\4\0\0=\3\14\2B\0\2\1K\0\1\0\radapters\1\0\0\22ignore_file_types\1\0\0\1\4\0\0\vpython\blua\trust\21neotest-vim-test\17neotest-rust\20neotest-plenary\bdap\1\0\0\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\t����\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Conditional loads
time([[Conditional loading of pear-tree]], true)
  require("packer.load")({"pear-tree"}, {}, _G.packer_plugins)
time([[Conditional loading of pear-tree]], false)
time([[Conditional loading of rust-tools.nvim]], true)
  require("packer.load")({"rust-tools.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of rust-tools.nvim]], false)
time([[Conditional loading of gitsigns.nvim]], true)
  require("packer.load")({"gitsigns.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of gitsigns.nvim]], false)
time([[Conditional loading of isort.nvim]], true)
  require("packer.load")({"isort.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of isort.nvim]], false)
time([[Conditional loading of lazygit.nvim]], true)
  require("packer.load")({"lazygit.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lazygit.nvim]], false)
time([[Conditional loading of lsp_signature.nvim]], true)
  require("packer.load")({"lsp_signature.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lsp_signature.nvim]], false)
time([[Conditional loading of copilot.vim]], true)
  require("packer.load")({"copilot.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of copilot.vim]], false)
time([[Conditional loading of black-nvim]], true)
  require("packer.load")({"black-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of black-nvim]], false)
time([[Conditional loading of asyncrun.vim]], true)
  require("packer.load")({"asyncrun.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of asyncrun.vim]], false)
time([[Conditional loading of marks.nvim]], true)
  require("packer.load")({"marks.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of marks.nvim]], false)
time([[Conditional loading of nvim-lightbulb]], true)
  require("packer.load")({"nvim-lightbulb"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lightbulb]], false)
time([[Conditional loading of undotree]], true)
  require("packer.load")({"undotree"}, {}, _G.packer_plugins)
time([[Conditional loading of undotree]], false)
time([[Conditional loading of nvim-lspconfig]], true)
  require("packer.load")({"nvim-lspconfig"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lspconfig]], false)
time([[Conditional loading of vim-dispatch]], true)
  require("packer.load")({"vim-dispatch"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-dispatch]], false)
time([[Conditional loading of trouble.nvim]], true)
  require("packer.load")({"trouble.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of trouble.nvim]], false)
time([[Conditional loading of nvim-cmp]], true)
  require("packer.load")({"nvim-cmp"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-cmp]], false)
time([[Conditional loading of git-messenger.vim]], true)
  require("packer.load")({"git-messenger.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of git-messenger.vim]], false)
time([[Conditional loading of nvim-colorizer.lua]], true)
  require("packer.load")({"nvim-colorizer.lua"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-colorizer.lua]], false)

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