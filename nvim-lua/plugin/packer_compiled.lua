-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/Thomas.Pollak/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/Thomas.Pollak/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/Thomas.Pollak/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/Thomas.Pollak/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/Thomas.Pollak/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bclose.vim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/bclose.vim",
    url = "https://github.com/rbgrouleff/bclose.vim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\nZ\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\26copilot_assume_mapped\23copilot_no_tab_map\6g\bvim\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\nQ\0\1\3\0\5\0\0065\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1L\1\2\0\15Whitespace\1\0\1\afg\bred\16ColorColumn\1\0\0\1\0\1\abg\f#2a2a2aÐ\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\2\14bg_search\f#163356\19cursor_line_nr\f#FFEA00\rsidebars\1\4\0\0\aqf\vpacker\rterminal\1\0\1\16theme_style\17dark_default\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nü\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\23finder_action_keys\1\0\6\16scroll_down\n<c-.>\vvsplit\n<c-v>\14scroll_up\n<c-,>\nsplit\n<c-s>\tquit\n<esc>\topen\t<cr>\21code_action_keys\1\0\2\texec\t<cr>\tquit\n<esc>\1\0\1\23rename_action_quit\n<esc>\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n­\2\0\0\b\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0035\4\b\0004\5\3\0005\6\a\0>\6\1\5=\5\t\0045\5\n\0=\5\v\0044\5\3\0005\6\14\0009\a\f\0>\a\1\0069\a\r\0=\a\15\6>\6\1\5=\5\16\4=\4\17\3B\1\2\1K\0\1\0\rsections\14lualine_x\tcond\1\0\0\17is_available\17get_location\14lualine_y\1\2\0\0\rfiletype\14lualine_c\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\1\ntheme\24github_dark_default\nsetup\flualine\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireˆ\1\0\1\3\3\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\n€-\1\1\0B\1\1\2\15\0\1\0X\2\4€-\1\2\0009\1\2\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\2À\0À\rcomplete\19expand_or_jump\23expand_or_jumpableŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisible–\1\0\1\a\1\t\0\21-\1\0\0009\1\0\0019\1\1\1B\1\1\0016\1\2\0009\1\3\0019\1\4\1B\1\1\2\6\1\5\0X\2\b€6\2\2\0009\2\6\0029\2\a\2\18\4\1\0'\5\b\0+\6\2\0B\2\4\1X\2\2€\18\2\0\0B\2\1\1K\0\1\0\0À\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\nabort\fmappingº\5\1\0\r\0+\0Q6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0054\6\0\0=\6\n\0059\6\v\0009\6\f\0069\6\r\0065\b\15\0009\t\v\0009\t\14\t)\v\4\0B\t\2\2=\t\16\b9\t\v\0009\t\14\t)\vüÿB\t\2\2=\t\17\b9\t\v\0009\t\18\tB\t\1\2=\t\19\b9\t\v\0009\t\20\tB\t\1\2=\t\21\b9\t\v\0009\t\22\t5\v\23\0B\t\2\2=\t\24\b9\t\v\0009\t\25\tB\t\1\2=\t\26\b9\t\v\0009\t\27\tB\t\1\2=\t\28\b9\t\v\0003\v\29\0005\f\30\0B\t\3\2=\t\31\b9\t\v\0003\v \0005\f!\0B\t\3\2=\t\"\b9\t\v\0003\v#\0005\f$\0B\t\3\2=\t%\bB\6\2\2=\6\v\0059\6&\0009\6'\0064\b\4\0005\t(\0>\t\1\b5\t)\0>\t\2\b5\t*\0>\t\3\bB\6\2\2=\6'\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\19max_item_count\3\5\tname\fluasnip\1\0\2\19max_item_count\3\15\tname\rnvim_lsp\fsources\vconfig\n<C-e>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-k>\21select_prev_item\n<C-j>\21select_next_item\t<CR>\1\0\1\vselect\1\fconfirm\n<C-g>\nabort\14<C-space>\rcomplete\n<C-'>\n<C-;>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\18navic_silence\6g\bvim\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nï\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\venable\2\19enable_autocmd\1\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\1\venable\2\1\0\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pear-tree"] = {
    config = { "\27LJ\2\nh\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\31pear_tree_map_special_keys pear_tree_repeatable_expand\6g\bvim\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/pear-tree",
    url = "https://github.com/tmsvg/pear-tree"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["qf_helper.nvim"] = {
    config = { "\27LJ\2\nÇ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\floclist\1\0\6\21default_bindings\2\14autoclose\2\19track_location\vcursor\15min_height\3\6\15max_height\3\20\20default_options\2\rquickfix\1\0\6\21default_bindings\2\14autoclose\2\19track_location\vcursor\15min_height\3\6\15max_height\3\20\20default_options\2\1\0\2\19prefer_loclist\2\25sort_lsp_diagnostics\2\nsetup\14qf_helper\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/qf_helper.nvim",
    url = "https://github.com/stevearc/qf_helper.nvim"
  },
  ["ranger.vim"] = {
    config = { "\27LJ\2\nV\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\20ranger_map_keys\25ranger_replace_netrw\6g\bvim\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/ranger.vim",
    url = "https://github.com/francoiscabrol/ranger.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n÷\1\0\0\b\0\18\0\0246\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\14\0005\5\v\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\t\0=\a\n\6=\6\f\0054\6\0\0=\6\r\5=\5\15\4=\4\17\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\0032\nshell\tfish\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nÑ\1\0\0\6\0\v\1\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\23€6\0\0\0009\0\1\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\0019\1\6\1\18\3\0\0B\1\2\2\19\1\1\0\b\1\0\0X\1\a€6\1\0\0009\1\1\0019\1\a\1\18\3\0\0'\4\b\0)\5¼\2B\1\4\0016\1\0\0009\1\t\1=\0\n\1K\0\1\0\fundodir\bopt\6p\nmkdir\16isdirectory\15~/.undodir\vexpand\20persistent_undo\bhas\afn\bvim\0\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/jubnzv/virtual-types.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\nQ\0\1\3\0\5\0\0065\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1L\1\2\0\15Whitespace\1\0\1\afg\bred\16ColorColumn\1\0\0\1\0\1\abg\f#2a2a2aÐ\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\2\14bg_search\f#163356\19cursor_line_nr\f#FFEA00\rsidebars\1\4\0\0\aqf\vpacker\rterminal\1\0\1\16theme_style\17dark_default\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireˆ\1\0\1\3\3\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\n€-\1\1\0B\1\1\2\15\0\1\0X\2\4€-\1\2\0009\1\2\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\2À\0À\rcomplete\19expand_or_jump\23expand_or_jumpableŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisible–\1\0\1\a\1\t\0\21-\1\0\0009\1\0\0019\1\1\1B\1\1\0016\1\2\0009\1\3\0019\1\4\1B\1\1\2\6\1\5\0X\2\b€6\2\2\0009\2\6\0029\2\a\2\18\4\1\0'\5\b\0+\6\2\0B\2\4\1X\2\2€\18\2\0\0B\2\1\1K\0\1\0\0À\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\nabort\fmappingº\5\1\0\r\0+\0Q6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0054\6\0\0=\6\n\0059\6\v\0009\6\f\0069\6\r\0065\b\15\0009\t\v\0009\t\14\t)\v\4\0B\t\2\2=\t\16\b9\t\v\0009\t\14\t)\vüÿB\t\2\2=\t\17\b9\t\v\0009\t\18\tB\t\1\2=\t\19\b9\t\v\0009\t\20\tB\t\1\2=\t\21\b9\t\v\0009\t\22\t5\v\23\0B\t\2\2=\t\24\b9\t\v\0009\t\25\tB\t\1\2=\t\26\b9\t\v\0009\t\27\tB\t\1\2=\t\28\b9\t\v\0003\v\29\0005\f\30\0B\t\3\2=\t\31\b9\t\v\0003\v \0005\f!\0B\t\3\2=\t\"\b9\t\v\0003\v#\0005\f$\0B\t\3\2=\t%\bB\6\2\2=\6\v\0059\6&\0009\6'\0064\b\4\0005\t(\0>\t\1\b5\t)\0>\t\2\b5\t*\0>\t\3\bB\6\2\2=\6'\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\19max_item_count\3\5\tname\fluasnip\1\0\2\19max_item_count\3\15\tname\rnvim_lsp\fsources\vconfig\n<C-e>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-k>\21select_prev_item\n<C-j>\21select_next_item\t<CR>\1\0\1\vselect\1\fconfirm\n<C-g>\nabort\14<C-space>\rcomplete\n<C-'>\n<C-;>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: pear-tree
time([[Config for pear-tree]], true)
try_loadstring("\27LJ\2\nh\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\31pear_tree_map_special_keys pear_tree_repeatable_expand\6g\bvim\0", "config", "pear-tree")
time([[Config for pear-tree]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n§\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a€6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16€9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5€9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6€6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2€'\6\r\0X\a\1€'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\18navic_silence\6g\bvim\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nï\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\venable\2\19enable_autocmd\1\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\1\venable\2\1\0\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n÷\1\0\0\b\0\18\0\0246\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\14\0005\5\v\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\t\0=\a\n\6=\6\f\0054\6\0\0=\6\r\5=\5\15\4=\4\17\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: qf_helper.nvim
time([[Config for qf_helper.nvim]], true)
try_loadstring("\27LJ\2\nÇ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\floclist\1\0\6\21default_bindings\2\14autoclose\2\19track_location\vcursor\15min_height\3\6\15max_height\3\20\20default_options\2\rquickfix\1\0\6\21default_bindings\2\14autoclose\2\19track_location\vcursor\15min_height\3\6\15max_height\3\20\20default_options\2\1\0\2\19prefer_loclist\2\25sort_lsp_diagnostics\2\nsetup\14qf_helper\frequire\0", "config", "qf_helper.nvim")
time([[Config for qf_helper.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\0032\nshell\tfish\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nü\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\23finder_action_keys\1\0\6\16scroll_down\n<c-.>\vvsplit\n<c-v>\14scroll_up\n<c-,>\nsplit\n<c-s>\tquit\n<esc>\topen\t<cr>\21code_action_keys\1\0\2\texec\t<cr>\tquit\n<esc>\1\0\1\23rename_action_quit\n<esc>\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\6\0\v\1\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\23€6\0\0\0009\0\1\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\0019\1\6\1\18\3\0\0B\1\2\2\19\1\1\0\b\1\0\0X\1\a€6\1\0\0009\1\1\0019\1\a\1\18\3\0\0'\4\b\0)\5¼\2B\1\4\0016\1\0\0009\1\t\1=\0\n\1K\0\1\0\fundodir\bopt\6p\nmkdir\16isdirectory\15~/.undodir\vexpand\20persistent_undo\bhas\afn\bvim\0\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\26copilot_assume_mapped\23copilot_no_tab_map\6g\bvim\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n­\2\0\0\b\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0035\4\b\0004\5\3\0005\6\a\0>\6\1\5=\5\t\0045\5\n\0=\5\v\0044\5\3\0005\6\14\0009\a\f\0>\a\1\0069\a\r\0=\a\15\6>\6\1\5=\5\16\4=\4\17\3B\1\2\1K\0\1\0\rsections\14lualine_x\tcond\1\0\0\17is_available\17get_location\14lualine_y\1\2\0\0\rfiletype\14lualine_c\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\1\ntheme\24github_dark_default\nsetup\flualine\15nvim-navic\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: ranger.vim
time([[Config for ranger.vim]], true)
try_loadstring("\27LJ\2\nV\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\20ranger_map_keys\25ranger_replace_netrw\6g\bvim\0", "config", "ranger.vim")
time([[Config for ranger.vim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
