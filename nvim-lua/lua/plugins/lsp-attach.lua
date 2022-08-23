local M = {}

local on_attach = function(client, bufnr)
    -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({ ignore = {"null-ls"} })]]
    -- client.offset_encoding = "utf-8"
    -- require 'virtualtypes'.on_attach(client, bufnr)
    require 'lsp_signature'.on_attach({
        bind = true
    })

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
        { silent = true, noremap = true }
    )
    vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
        { silent = true, noremap = true }
    )
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>f', telescope_builtin.lsp_workspace_symbols, bufopts)
    vim.keymap.set('n', '<leader>s', telescope_builtin.lsp_document_symbols, bufopts)
    vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, bufopts)
    vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, bufopts)
    vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', 'gt', telescope_builtin.lsp_type_definitions, bufopts)

    vim.keymap.set("n", "gk", function()
        vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
        vim.cmd [[source ~/.config/nvim/lua/plugins/lualine.lua]]
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "gj", function()
        vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
        vim.cmd [[source ~/.config/nvim/lua/plugins/lualine.lua]]
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "gK", function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ANY })
        vim.cmd [[source ~/.config/nvim/lua/plugins/lualine.lua]]
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "gJ", function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ANY })
        vim.cmd [[source ~/.config/nvim/lua/plugins/lualine.lua]]
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "gh", vim.diagnostic.open_float, { silent = true, noremap = true })

    -- show hover doc and press twice will jumpto hover window
    --
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })

    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)


    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set("v", "ga", function()
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    --     action.range_code_action()
    -- end, { silent = true, noremap = true })

    if client and client.supports_method("textDocument/formatting") then
        vim.keymap.set('n', '<leader>q', vim.lsp.buf.formatting, bufopts)
    end

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

M.on_attach = on_attach
return M
