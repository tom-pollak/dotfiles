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
local package_path_str = "/Users/tom/.cache/nvim/packer_hererocks/2.1.1700008891/share/lua/5.1/?.lua;/Users/tom/.cache/nvim/packer_hererocks/2.1.1700008891/share/lua/5.1/?/init.lua;/Users/tom/.cache/nvim/packer_hererocks/2.1.1700008891/lib/luarocks/rocks-5.1/?.lua;/Users/tom/.cache/nvim/packer_hererocks/2.1.1700008891/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tom/.cache/nvim/packer_hererocks/2.1.1700008891/lib/lua/5.1/?.so"
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
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\nâ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14filetypes\1\0\1\rmarkdown\2\15suggestion\1\0\0\vkeymap\1\0\5\fdismiss\n<C-g>\fdecline\n<C-g>\16accept_line\1\vaccept\n<C-l>\16accept_word\n<C-n>\1\0\2\fenabled\2\17auto_trigger\2\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["git-messenger.vim"] = {
    config = { "\27LJ\2\ns\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0&git_messenger_no_default_mappings$git_messenger_always_into_popup\6g\bvim\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\nÙ\a\0\0\6\0-\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3!\0005\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\0045\5\31\0=\5 \4=\4\"\3=\3#\0025\3$\0005\4%\0005\5&\0=\5'\4=\4(\3=\3)\2B\0\2\0016\0*\0009\0+\0'\2,\0B\0\2\1K\0\1\0*colorscheme github_dark_high_contrast\bcmd\bvim\vdarken\rsidebars\tlist\1\5\0\0\aqf\vpacker\rterminal\ftrouble\1\0\1\venable\2\1\0\1\vfloats\2\vgroups\ball\1\0\0\rPmenuSel\1\0\2\abg\f#163356\afg\25palette.white.bright\23TelescopeSelection\1\0\2\abg\f#163356\afg\25palette.white.bright\31IndentBlanklineContextChar\1\0\2\bgui\14nocombine\nguifg\f#C678DD\24IndentBlanklineChar\1\0\2\bgui\14nocombine\nguifg\f#1e2228\25IlluminatedWordWrite\1\0\3\abg\f#2d3340\afg\tNONE\bgui\tNONE\24IlluminatedWordRead\1\0\3\abg\f#2d3340\afg\tNONE\bgui\tNONE\24IlluminatedWordText\1\0\3\abg\f#2d3340\afg\tNONE\bgui\tNONE\14IncSearch\1\0\2\abg\f#163356\afg\25palette.white.bright\vSearch\1\0\2\abg\f#163356\afg\25palette.white.bright\17CursorLineNr\1\0\1\afg\26palette.yellow.bright\22TreesitterContext\1\0\1\abg\f#22272e\16ColorColumn\1\0\0\1\0\1\abg\f#1e2228\nspecs\1\0\0\30github_dark_high_contrast\1\0\0\1\0\1\14bg_search\f#163356\nsetup\17github-theme\frequire\0" },
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
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29extensions.lualine-setup\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n¸\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\3\21delete_bookmark0\bdam\18set_bookmark0\acm\20delete_bookmark\adm\15bookmark_0\1\0\1\tsign\bâš‘\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nˆ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\2\20easing_function\ncubic\22respect_scrolloff\2\1\3\0\0\n<C-y>\n<C-e>\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nØ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\vphpdoc\1\0\2\21ensure_installed\ball\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\31extensions.telescope-setup\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n‹\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\1K\0\1\0\1\0\2\tjump\2\16skip_groups\2\rprevious\1\0\2\tjump\2\16skip_groups\2\tnext\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/tom/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
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
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\2\20easing_function\ncubic\22respect_scrolloff\2\1\3\0\0\n<C-y>\n<C-e>\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\31extensions.telescope-setup\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-surround
time([[Config for vim-surround]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 surround_no_insert_mappings\6g\bvim\0", "config", "vim-surround")
time([[Config for vim-surround]], false)
-- Config for: git-messenger.vim
time([[Config for git-messenger.vim]], true)
try_loadstring("\27LJ\2\ns\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0&git_messenger_no_default_mappings$git_messenger_always_into_popup\6g\bvim\0", "config", "git-messenger.vim")
time([[Config for git-messenger.vim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n‹\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\1K\0\1\0\1\0\2\tjump\2\16skip_groups\2\rprevious\1\0\2\tjump\2\16skip_groups\2\tnext\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\3\21delete_bookmark0\bdam\18set_bookmark0\acm\20delete_bookmark\adm\15bookmark_0\1\0\1\tsign\bâš‘\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\nÙ\a\0\0\6\0-\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3!\0005\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\0045\5\31\0=\5 \4=\4\"\3=\3#\0025\3$\0005\4%\0005\5&\0=\5'\4=\4(\3=\3)\2B\0\2\0016\0*\0009\0+\0'\2,\0B\0\2\1K\0\1\0*colorscheme github_dark_high_contrast\bcmd\bvim\vdarken\rsidebars\tlist\1\5\0\0\aqf\vpacker\rterminal\ftrouble\1\0\1\venable\2\1\0\1\vfloats\2\vgroups\ball\1\0\0\rPmenuSel\1\0\2\abg\f#163356\afg\25palette.white.bright\23TelescopeSelection\1\0\2\abg\f#163356\afg\25palette.white.bright\31IndentBlanklineContextChar\1\0\2\bgui\14nocombine\nguifg\f#C678DD\24IndentBlanklineChar\1\0\2\bgui\14nocombine\nguifg\f#1e2228\25IlluminatedWordWrite\1\0\3\abg\f#2d3340\afg\tNONE\bgui\tNONE\24IlluminatedWordRead\1\0\3\abg\f#2d3340\afg\tNONE\bgui\tNONE\24IlluminatedWordText\1\0\3\abg\f#2d3340\afg\tNONE\bgui\tNONE\14IncSearch\1\0\2\abg\f#163356\afg\25palette.white.bright\vSearch\1\0\2\abg\f#163356\afg\25palette.white.bright\17CursorLineNr\1\0\1\afg\26palette.yellow.bright\22TreesitterContext\1\0\1\abg\f#22272e\16ColorColumn\1\0\0\1\0\1\abg\f#1e2228\nspecs\1\0\0\30github_dark_high_contrast\1\0\0\1\0\1\14bg_search\f#163356\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29extensions.lualine-setup\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nØ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\vphpdoc\1\0\2\21ensure_installed\ball\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¡\3\0\1\t\0\21\00056\1\0\0009\1\1\0019\1\2\0015\2\3\0=\0\4\0026\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\t\0009\a\n\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\v\0009\a\f\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\r\0009\a\14\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\15\0009\a\16\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\17\0009\a\18\1\18\b\2\0B\3\5\0016\3\5\0009\3\6\0039\3\a\3'\5\b\0'\6\19\0009\a\20\1B\3\4\1K\0\1\0\17preview_hunk\15<leader>lp\19toggle_deleted\15<leader>ld\30toggle_current_line_blame\15<leader>lb\rdiffthis\15<leader>lo\14prev_hunk\14<leader>p\14next_hunk\14<leader>n\6n\bset\vkeymap\bvim\vbuffer\1\0\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

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
