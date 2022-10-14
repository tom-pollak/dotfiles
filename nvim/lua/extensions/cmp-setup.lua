local cmp = require 'cmp'
local luasnip = require 'luasnip'
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

-- https://github.com/hrsh7th/nvim-cmp/issues/156
local comparator = function(conf)
    local lsp_types = require('cmp.types').lsp
    return function(entry1, entry2)
        if entry1.source.name ~= 'nvim_lsp' then
            if entry2.source.name == 'nvim_lsp' then
                return false
            else
                return nil
            end
        end
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then
            return nil
        end
        return priority2 < priority1
    end
end

local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label < entry2.completion_item.label
end

cmp.setup({
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            return vim_item
        end,
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
        ['<C-space>'] = cmp.mapping.complete(),
        ['<C-g>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        --[[ ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), ]]
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(4)
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                --[[ elseif has_words_before() then ]]
                --[[     cmp.complete() ]]
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(-4)
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-l>"] = cmp.mapping(function(fallback)
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
        { name = "nvim_lsp_signature_help" },
        { name = 'nvim_lsp' },
        { name = 'luasnip', max_item_count = 5 }, -- For luasnip users.
        { name = 'path' },
        { name = 'dap' },
        -- { name = 'buffer' },
    }),
    sorting = {
        comparators = {
            comparator({
                kind_priority = {
                    Field = 11,
                    Property = 11,
                    Constant = 10,
                    Enum = 10,
                    EnumMember = 10,
                    Event = 10,
                    Function = 10,
                    Method = 10,
                    Operator = 10,
                    Reference = 10,
                    Struct = 10,
                    Variable = 9,
                    File = 8,
                    Folder = 8,
                    Class = 5,
                    Color = 5,
                    Module = 5,
                    Keyword = 2,
                    Constructor = 1,
                    Interface = 1,
                    Snippet = 0,
                    Text = 1,
                    TypeParameter = 1,
                    Unit = 1,
                    Value = 1,
                },
            }),
            label_comparator,
        },
    },
    -- filetype = ('gitcommit', {
    --     sources = cmp.config.sources({
    --         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    --     }, {
    --         { name = 'buffer' },
    --     })
    -- })

    --[[ enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end ]]
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches" }, {
    sources = {
        { name = "dap" },
    },
})

-- Set configuration for specific filetype.
