local cmp = require 'cmp'
local luasnip = require 'luasnip'
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local lspkind = require('lspkind')

cmp.setup({
    formatting = {
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                -- before = function(entry, vim_item)
                --     return vim_item
                -- end
            })
        }
    },
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-;>'] = cmp.mapping.scroll_docs(4),
        ["<C-'>"] = cmp.mapping.scroll_docs(-4),
        ['<C-space>'] = cmp.mapping.complete(),
        ['<C-g>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-e>"] = cmp.mapping(function(fallback)
            cmp.mapping.abort()
            local copilot_keys = vim.fn["copilot#Accept"]()
            if copilot_keys ~= "" then
                vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
                fallback()
            end
        end, { "i", "s" })
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count = 15 },
        { name = 'luasnip', max_item_count = 5 }, -- For luasnip users.
        { name = "nvim_lsp_signature_help" },
        { name = 'path' }
        -- { name = 'buffer' },
    }),
    -- filetype = ('gitcommit', {
    --     sources = cmp.config.sources({
    --         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    --     }, {
    --         { name = 'buffer' },
    --     })
    -- })
})

-- Set configuration for specific filetype.