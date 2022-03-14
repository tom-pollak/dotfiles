nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>

nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gca :lua vim.lsp.buf.code_action()<CR>
nnoremap gsd :lua vim.lsp.util.show_line_diagnostics()<CR>

nnoremap gj :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap gk :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

