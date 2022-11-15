-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr=nvim_treesitter#foldexpr()
local in_vim = not vim.g.vscode

require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    sync_install = false,
    indent = {
        enable = true,
        --[[ disable = { 'python' } ]]
    },
    matchup = {
        enable = in_vim
    },
    highlight = {
        enable = in_vim,
    },
    --[[ incremental_selection = { ]]
    --[[     enable = true, ]]
    --[[     keymaps = { ]]
    --[[         init_selection = '<TAB>', ]]
    --[[         scope_incremental = '<CR>', ]]
    --[[         node_incremental = '<TAB>', ]]
    --[[         node_decremental = '<S-TAB>', ]]
    --[[     }, ]]
    --[[ }, ]]
    rainbow = {
        enable = in_vim,
        extended_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    autotag = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',

                ['ak'] = '@class.outer',
                ['ik'] = '@class.inner',

                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',

                ['ac'] = '@conditional.outer',
                ['ic'] = '@conditional.inner',

                ['ie'] = '@call.inner',
                ['ae'] = '@call.outer',

                ['a<Leader>a'] = '@parameter.outer',
                ['i<Leader>a'] = '@parameter.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']f'] = '@function.outer',
                [']k'] = '@class.outer',
                [']l'] = '@loop.outer',
                [']c'] = '@conditional.outer',
                [']e'] = '@call.outer',
                [']a'] = '@parameter.outer',
            },

            goto_next_end = {
                [']F'] = '@function.outer',
                [']K'] = '@class.outer',
                [']L'] = '@loop.outer',
                [']C'] = '@conditional.outer',
                [']E'] = '@call.outer',
                [']A'] = '@parameter.outer',
            },

            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[<Leader>c'] = '@class.outer',
                ['[k'] = '@class.outer',
                ['[l'] = '@loop.outer',
                ['[c'] = '@conditional.outer',
                ['[e'] = '@call.outer',
                ['[a'] = '@parameter.outer',
            },

            goto_previous_end = {
                ['[F'] = '@function.outer',
                ['[<Leader>C'] = '@class.outer',
                ['[K'] = '@class.outer',
                ['[L'] = '@loop.outer',
                ['[C'] = '@conditional.outer',
                ['[E'] = '@call.outer',
                ['[A'] = '@parameter.outer',
            },
        },
    },

}

require 'treesitter-context'.setup {
    enable = true,
    patterns = {
        rust = {
            'impl_item',
            'struct',
            'enum',
            'mod',
            'match',
            'loop',
        },
    }
}
