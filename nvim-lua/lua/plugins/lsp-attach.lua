    if client and client.supports_method("textDocument/formatting") then
        vim.keymap.set('n', '<leader>q', vim.lsp.buf.formatting, bufopts)
    end
