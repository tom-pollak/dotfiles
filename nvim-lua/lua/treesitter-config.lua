require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = { -- dosen't work
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
  },
  context_commentstring = {
      enable = true
  }
}
