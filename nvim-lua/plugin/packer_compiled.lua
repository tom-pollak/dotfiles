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
    config = { "\27LJ\2\nß\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2Ä'\6\r\0X\a\1Ä'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
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
    config = { "\27LJ\2\nQ\0\1\3\0\5\0\0065\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1L\1\2\0\15Whitespace\1\0\1\afg\bred\16ColorColumn\1\0\0\1\0\1\abg\f#2a2a2a–\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\2\19cursor_line_nr\f#FFEA00\14bg_search\f#163356\rsidebars\1\4\0\0\aqf\vpacker\rterminal\1\0\1\16theme_style\17dark_default\nsetup\17github-theme\frequire\0" },
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
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nπ\2\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\2\nsetup\21indent_blankline\frequireG highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine @ highlight IndentBlanklineChar guifg=#292929 gui=nocombine \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nñ\2\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\23finder_action_keys\1\0\6\14scroll_up\n<c-,>\nsplit\n<c-s>\16scroll_down\n<c-.>\topen\t<cr>\tquit\n<esc>\vvsplit\n<c-v>\21code_action_keys\1\0\2\texec\t<cr>\tquit\n<esc>\1\0\2\23rename_action_quit\n<esc>\29code_action_num_shortcut\1\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nâ\3\0\0\b\0\22\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0035\4\n\0004\5\3\0005\6\a\0005\a\b\0=\a\t\6>\6\1\5=\5\v\0044\5\3\0005\6\f\0>\6\1\5=\5\r\0045\5\14\0=\5\15\0044\5\3\0005\6\18\0009\a\16\0>\a\1\0069\a\17\0=\a\19\6>\6\1\5=\5\20\4=\4\21\3B\1\2\1K\0\1\0\rsections\14lualine_x\tcond\1\0\0\17is_available\17get_location\14lualine_y\1\2\0\0\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\0\0\fsymbols\1\0\3\nadded\6+\rmodified\6~\fremoved\6-\1\2\1\0\tdiff\fcolored\2\foptions\1\0\0\1\0\1\ntheme\24github_dark_default\nsetup\flualine\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire≈\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\2¿\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleñ\1\0\1\a\1\t\0\21-\1\0\0009\1\0\0019\1\1\1B\1\1\0016\1\2\0009\1\3\0019\1\4\1B\1\1\2\6\1\5\0X\2\bÄ6\2\2\0009\2\6\0029\2\a\2\18\4\1\0'\5\b\0+\6\2\0B\2\4\1X\2\2Ä\18\2\0\0B\2\1\1K\0\1\0\0¿\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\nabort\fmapping¿\6\1\0\14\0003\0^6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0006\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\f\0005\a\n\0005\b\b\0009\t\6\0035\v\a\0B\t\2\2=\t\t\b=\b\v\a=\a\v\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0064\a\0\0=\a\17\0069\a\18\0009\a\19\a9\a\20\a5\t\22\0009\n\18\0009\n\21\n)\f\4\0B\n\2\2=\n\23\t9\n\18\0009\n\21\n)\f¸ˇB\n\2\2=\n\24\t9\n\18\0009\n\25\nB\n\1\2=\n\26\t9\n\18\0009\n\27\nB\n\1\2=\n\28\t9\n\18\0009\n\29\n5\f\30\0B\n\2\2=\n\31\t9\n\18\0009\n \nB\n\1\2=\n!\t9\n\18\0009\n\"\nB\n\1\2=\n#\t9\n\18\0003\f$\0005\r%\0B\n\3\2=\n&\t9\n\18\0003\f'\0005\r(\0B\n\3\2=\n)\t9\n\18\0003\f*\0005\r+\0B\n\3\2=\n,\tB\a\2\2=\a\18\0069\a-\0009\a.\a4\t\5\0005\n/\0>\n\1\t5\n0\0>\n\2\t5\n1\0>\n\3\t5\n2\0>\n\4\tB\a\2\2=\a.\6B\4\2\0012\0\0ÄK\0\1\0\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\19max_item_count\3\5\tname\fluasnip\1\0\2\19max_item_count\3\15\tname\rnvim_lsp\fsources\vconfig\n<C-e>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-k>\21select_prev_item\n<C-j>\21select_next_item\t<CR>\1\0\1\vselect\1\fconfirm\n<C-g>\nabort\14<C-space>\rcomplete\n<C-'>\n<C-;>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\vexpand\1\0\0\0\1\0\0\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\tmode\vsymbol\15cmp_format\nsetup\flspkind\0\fluasnip\bcmp\frequire\0" },
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
    config = { "\27LJ\2\n¡\3\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\nicons\1\0\0\1\0\26\bKey\tÓ™ì \vNumber\tÓ™ê \tNull\tÓ™è \vString\tÓÆç \15EnumMember\tÓ≠û \rConstant\tÓ≠ù \vStruct\tÓ™ë \rVariable\tÓ™à \rFunction\tÓ™å \nEvent\tÓ™Ü \14Interface\tÓ≠° \rOperator\tÓ≠§ \tEnum\tÓ™ï \16Constructor\tÓ™å \18TypeParameter\tÓ™í \nField\tÓ≠ü \rProperty\tÓ≠• \vMethod\tÓ™å \nClass\tÓ≠õ \fPackage\tÓ¨© \14Namespace\tÓ™ã \vModule\tÓ™ã \vObject\tÓ™ã \tFile\tÓ©ª \nArray\tÓ™ä \fBoolean\tÓ™è \nsetup\15nvim-navic\frequire\18navic_silence\6g\bvim\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nâ\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\2\21ensure_installed\ball\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
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
    config = { "\27LJ\2\n«\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\floclist\1\0\6\15min_height\3\6\15max_height\3\20\20default_options\2\21default_bindings\2\14autoclose\2\19track_location\vcursor\rquickfix\1\0\6\15min_height\3\6\15max_height\3\20\20default_options\2\21default_bindings\2\14autoclose\2\19track_location\vcursor\1\0\2\25sort_lsp_diagnostics\2\19prefer_loclist\2\nsetup\14qf_helper\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/qf_helper.nvim",
    url = "https://github.com/stevearc/qf_helper.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n˜\6\0\0\v\0+\1P6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\18\0005\4\4\0005\5\5\0=\5\6\0045\5\14\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\0069\a\f\0=\a\r\6=\6\15\0054\6\0\0=\6\16\5=\5\17\4=\4\19\0035\4\21\0005\5\20\0=\5\22\4=\4\23\0035\4\25\0005\5\24\0=\5\26\0045\5\27\0005\6\"\0005\a \0006\b\0\0'\n\2\0B\b\2\0029\b\28\b9\b\29\b9\b\30\b9\b\31\b=\b!\a=\a\15\0064\a\0\0=\a\16\6=\6\17\5=\5\29\0045\5#\0005\6$\0=\6%\5=\5&\0044\5\3\0006\6\0\0'\b'\0B\6\2\0029\6(\6B\6\1\0?\6\0\0=\5)\4=\4\28\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1*\1'\3\29\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1*\1'\3&\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1*\1'\3)\0B\1\2\1K\0\1\0\19load_extension\14ui-select\15get_cursor\21telescope.themes\fproject\14base_dirs\1\3\0\0\15~/projects\31~/co/spyglass/applications\1\0\1\ntheme\rdropdown\1\0\0\n<C-d>\1\0\0\20goto_parent_dir\factions\17file_browser\15extensions\1\0\2\17hijack_netrw\2\ntheme\bivy\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\fpickers\fbuffers\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\6n\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\18layout_config\1\0\2\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\1\0\2\20layout_strategy\rvertical\17shorten_path\2\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\3(\nshell\tfish\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/Thomas.Pollak/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n—\1\0\0\6\0\v\1\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\23Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\0019\1\6\1\18\3\0\0B\1\2\2\19\1\1\0\b\1\0\0X\1\aÄ6\1\0\0009\1\1\0019\1\a\1\18\3\0\0'\4\b\0)\5º\2B\1\4\0016\1\0\0009\1\t\1=\0\n\1K\0\1\0\fundodir\bopt\6p\nmkdir\16isdirectory\15~/.undodir\vexpand\20persistent_undo\bhas\afn\bvim\0\0" },
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
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\n¡\3\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\nicons\1\0\0\1\0\26\bKey\tÓ™ì \vNumber\tÓ™ê \tNull\tÓ™è \vString\tÓÆç \15EnumMember\tÓ≠û \rConstant\tÓ≠ù \vStruct\tÓ™ë \rVariable\tÓ™à \rFunction\tÓ™å \nEvent\tÓ™Ü \14Interface\tÓ≠° \rOperator\tÓ≠§ \tEnum\tÓ™ï \16Constructor\tÓ™å \18TypeParameter\tÓ™í \nField\tÓ≠ü \rProperty\tÓ≠• \vMethod\tÓ™å \nClass\tÓ≠õ \fPackage\tÓ¨© \14Namespace\tÓ™ã \vModule\tÓ™ã \vObject\tÓ™ã \tFile\tÓ©ª \nArray\tÓ™ä \fBoolean\tÓ™è \nsetup\15nvim-navic\frequire\18navic_silence\6g\bvim\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: qf_helper.nvim
time([[Config for qf_helper.nvim]], true)
try_loadstring("\27LJ\2\n«\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\floclist\1\0\6\15min_height\3\6\15max_height\3\20\20default_options\2\21default_bindings\2\14autoclose\2\19track_location\vcursor\rquickfix\1\0\6\15min_height\3\6\15max_height\3\20\20default_options\2\21default_bindings\2\14autoclose\2\19track_location\vcursor\1\0\2\25sort_lsp_diagnostics\2\19prefer_loclist\2\nsetup\14qf_helper\frequire\0", "config", "qf_helper.nvim")
time([[Config for qf_helper.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nπ\2\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 #show_trailing_blankline_indent\2\nsetup\21indent_blankline\frequireG highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine @ highlight IndentBlanklineChar guifg=#292929 gui=nocombine \bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lazygit.nvim
time([[Config for lazygit.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lazygit.nvim")
time([[Config for lazygit.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nâ\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\2\21ensure_installed\ball\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: pear-tree
time([[Config for pear-tree]], true)
try_loadstring("\27LJ\2\nh\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\31pear_tree_map_special_keys pear_tree_repeatable_expand\6g\bvim\0", "config", "pear-tree")
time([[Config for pear-tree]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nß\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2Ä'\6\r\0X\a\1Ä'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nñ\2\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\23finder_action_keys\1\0\6\14scroll_up\n<c-,>\nsplit\n<c-s>\16scroll_down\n<c-.>\topen\t<cr>\tquit\n<esc>\vvsplit\n<c-v>\21code_action_keys\1\0\2\texec\t<cr>\tquit\n<esc>\1\0\2\23rename_action_quit\n<esc>\29code_action_num_shortcut\1\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\26copilot_assume_mapped\23copilot_no_tab_map\6g\bvim\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\nQ\0\1\3\0\5\0\0065\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\1L\1\2\0\15Whitespace\1\0\1\afg\bred\16ColorColumn\1\0\0\1\0\1\abg\f#2a2a2a–\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\2\19cursor_line_nr\f#FFEA00\14bg_search\f#163356\rsidebars\1\4\0\0\aqf\vpacker\rterminal\1\0\1\16theme_style\17dark_default\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\3(\nshell\tfish\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nâ\3\0\0\b\0\22\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0035\4\n\0004\5\3\0005\6\a\0005\a\b\0=\a\t\6>\6\1\5=\5\v\0044\5\3\0005\6\f\0>\6\1\5=\5\r\0045\5\14\0=\5\15\0044\5\3\0005\6\18\0009\a\16\0>\a\1\0069\a\17\0=\a\19\6>\6\1\5=\5\20\4=\4\21\3B\1\2\1K\0\1\0\rsections\14lualine_x\tcond\1\0\0\17is_available\17get_location\14lualine_y\1\2\0\0\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\0\0\fsymbols\1\0\3\nadded\6+\rmodified\6~\fremoved\6-\1\2\1\0\tdiff\fcolored\2\foptions\1\0\0\1\0\1\ntheme\24github_dark_default\nsetup\flualine\15nvim-navic\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n˜\6\0\0\v\0+\1P6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\18\0005\4\4\0005\5\5\0=\5\6\0045\5\14\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\0069\a\f\0=\a\r\6=\6\15\0054\6\0\0=\6\16\5=\5\17\4=\4\19\0035\4\21\0005\5\20\0=\5\22\4=\4\23\0035\4\25\0005\5\24\0=\5\26\0045\5\27\0005\6\"\0005\a \0006\b\0\0'\n\2\0B\b\2\0029\b\28\b9\b\29\b9\b\30\b9\b\31\b=\b!\a=\a\15\0064\a\0\0=\a\16\6=\6\17\5=\5\29\0045\5#\0005\6$\0=\6%\5=\5&\0044\5\3\0006\6\0\0'\b'\0B\6\2\0029\6(\6B\6\1\0?\6\0\0=\5)\4=\4\28\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1*\1'\3\29\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1*\1'\3&\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1*\1'\3)\0B\1\2\1K\0\1\0\19load_extension\14ui-select\15get_cursor\21telescope.themes\fproject\14base_dirs\1\3\0\0\15~/projects\31~/co/spyglass/applications\1\0\1\ntheme\rdropdown\1\0\0\n<C-d>\1\0\0\20goto_parent_dir\factions\17file_browser\15extensions\1\0\2\17hijack_netrw\2\ntheme\bivy\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\fpickers\fbuffers\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\6n\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\18layout_config\1\0\2\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\1\0\2\20layout_strategy\rvertical\17shorten_path\2\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n—\1\0\0\6\0\v\1\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\23Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\0019\1\6\1\18\3\0\0B\1\2\2\19\1\1\0\b\1\0\0X\1\aÄ6\1\0\0009\1\1\0019\1\a\1\18\3\0\0'\4\b\0)\5º\2B\1\4\0016\1\0\0009\1\t\1=\0\n\1K\0\1\0\fundodir\bopt\6p\nmkdir\16isdirectory\15~/.undodir\vexpand\20persistent_undo\bhas\afn\bvim\0\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire≈\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\2¿\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleñ\1\0\1\a\1\t\0\21-\1\0\0009\1\0\0019\1\1\1B\1\1\0016\1\2\0009\1\3\0019\1\4\1B\1\1\2\6\1\5\0X\2\bÄ6\2\2\0009\2\6\0029\2\a\2\18\4\1\0'\5\b\0+\6\2\0B\2\4\1X\2\2Ä\18\2\0\0B\2\1\1K\0\1\0\0¿\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\nabort\fmapping¿\6\1\0\14\0003\0^6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0006\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\f\0005\a\n\0005\b\b\0009\t\6\0035\v\a\0B\t\2\2=\t\t\b=\b\v\a=\a\v\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0064\a\0\0=\a\17\0069\a\18\0009\a\19\a9\a\20\a5\t\22\0009\n\18\0009\n\21\n)\f\4\0B\n\2\2=\n\23\t9\n\18\0009\n\21\n)\f¸ˇB\n\2\2=\n\24\t9\n\18\0009\n\25\nB\n\1\2=\n\26\t9\n\18\0009\n\27\nB\n\1\2=\n\28\t9\n\18\0009\n\29\n5\f\30\0B\n\2\2=\n\31\t9\n\18\0009\n \nB\n\1\2=\n!\t9\n\18\0009\n\"\nB\n\1\2=\n#\t9\n\18\0003\f$\0005\r%\0B\n\3\2=\n&\t9\n\18\0003\f'\0005\r(\0B\n\3\2=\n)\t9\n\18\0003\f*\0005\r+\0B\n\3\2=\n,\tB\a\2\2=\a\18\0069\a-\0009\a.\a4\t\5\0005\n/\0>\n\1\t5\n0\0>\n\2\t5\n1\0>\n\3\t5\n2\0>\n\4\tB\a\2\2=\a.\6B\4\2\0012\0\0ÄK\0\1\0\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\19max_item_count\3\5\tname\fluasnip\1\0\2\19max_item_count\3\15\tname\rnvim_lsp\fsources\vconfig\n<C-e>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-k>\21select_prev_item\n<C-j>\21select_next_item\t<CR>\1\0\1\vselect\1\fconfirm\n<C-g>\nabort\14<C-space>\rcomplete\n<C-'>\n<C-;>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\vexpand\1\0\0\0\1\0\0\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\tmode\vsymbol\15cmp_format\nsetup\flspkind\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
