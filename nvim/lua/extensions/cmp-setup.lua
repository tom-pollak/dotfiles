local cmp = require("cmp")
local luasnip = require("luasnip")

-- Copilot disabled on autocomplete
cmp.event:on("menu_opened",
             function() vim.b.copilot_suggestion_hidden = true end)

cmp.event:on("menu_closed",
             function() vim.b.copilot_suggestion_hidden = false end)

-- https://github.com/hrsh7th/nvim-cmp/issues/156
local comparator = function(conf)
    local lsp_types = require("cmp.types").lsp
    return function(entry1, entry2)
        if entry1.source.name ~= "nvim_lsp" then
            if entry2.source.name == "nvim_lsp" then
                return false
            else
                return nil
            end
        end
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then return nil end
        return priority2 < priority1
    end
end

local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label < entry2.completion_item.label
end

local M = {}

local cmp_setup = {
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping(function(fallback)
            if not cmp.visible() then
                cmp.complete()
            else
                -- TODO: Toggle documentation window
                fallback()
            end
        end, {"i", "s"}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({select = true})
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<C-g>"] = cmp.mapping.abort(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(4)
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(-4)
            else
                fallback()
            end
        end, {"i", "s"})
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
                    Value = 1
                }
            }), label_comparator
        }
    }
}

M.cmp_setup = cmp_setup
return M
