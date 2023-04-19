local M = {}

local on_attach = function(client, bufnr)
    local bufopts = {noremap = true, silent = true, buffer = bufnr}

    vim.api.nvim_set_keymap("n", "<leader>x",
                            "<cmd>Trouble workspace_diagnostics<cr>",
                            {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>X",
                            "<cmd>Trouble document_diagnostics<cr>",
                            {silent = true, noremap = true})
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>s', telescope_builtin.lsp_document_symbols,
                   bufopts)
    vim.keymap.set('n', '<leader>S',
                   telescope_builtin.lsp_dynamic_workspace_symbols, bufopts)

    vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, bufopts)
    vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, bufopts)
    vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', 'gt', telescope_builtin.lsp_type_definitions, bufopts)

    vim.keymap.set("n", "gk", function()
        vim.diagnostic.goto_prev({
            severity = {min = vim.diagnostic.severity.WARN}
        })
        vim.cmd [[source ~/.config/nvim/lua/extensions/lualine.lua]]
    end, {silent = true, noremap = true})

    vim.keymap.set("n", "gj", function()
        vim.diagnostic.goto_next({
            severity = {min = vim.diagnostic.severity.WARN}
        })
        vim.cmd [[source ~/.config/nvim/lua/extensions/lualine.lua]]
    end, {silent = true, noremap = true})

    vim.keymap.set("n", "gK", function()
        vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ANY})
        vim.cmd [[source ~/.config/nvim/lua/extensions/lualine.lua]]
    end, {silent = true, noremap = true})

    vim.keymap.set("n", "gJ", function()
        vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ANY})
        vim.cmd [[source ~/.config/nvim/lua/extensions/lualine.lua]]
    end, {silent = true, noremap = true})

    vim.keymap.set("n", "gh", vim.diagnostic.open_float,
                   {silent = true, noremap = true})

    vim.keymap.set("n", "ga", vim.lsp.buf.code_action,
                   {silent = true, noremap = true})

    -- show hover doc and press twice will jumpto hover window
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {silent = true})

    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

end

M.on_attach = on_attach
return M
