let mapleader = " "

let g:python3_host_prog = '/usr/bin/python3'

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:completion_matching_smart_case = 1
let g:completion_enable_snippet = 'vim-vsnip'

let g:completion_chain_complete_list = {
    \ 'default': [
        \ { 'complete_items':  ['lsp', 'buffers', 'tags', 'snippet', 'tabnine'] },
    \ { 'mode': '<c-p>' },
    \ { 'mode': '<c-n>' }
    \]
\}

imap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<CR>'
smap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<CR>'

" Jump forward or backward
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
imap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
smap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'

nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" let g:vsnip_filetypes = {}

lua require'nvim-treesitter.configs'.setup {
    \ ensure_installed = "maintained",
    \ highlight = { enable = true},
    \ rainbow = { enable = true },
    \ }

let g:airline#extensions#tabline#enabled = 1

let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript  = ['prettier']
let g:neoformat_enabled_html  = ['prettier']
let g:neoformat_enabled_java  = ['prettier']
let g:neoformat_enabled_css  = ['prettier']
let g:neoformat_enabled_scss  = ['prettier']

let g:neoformat_basic_format_trim = 1

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_map_special_keys = 0

let g:float_preview#docked = 1

imap <BS> <Plug>(PearTreeBackspace)
imap jk <Plug>(PearTreeFinishExpansion)
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<Plug>(PearTreeExpand)"


augroup run_file
    autocmd!
    autocmd BufNewFile,Bufread *.py nnoremap <leader>rr :call RunPython()<CR>
    autocmd BufNewFile,Bufread *.py nnoremap <leader>rt :call TestPython()<CR>
    autocmd BufNewFile,Bufread *.java nnoremap <leader>rr :call RunJava()<cr>
augroup end

    " nerdtree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif

augroup options
    autocmd!
    autocmd FileType java let b:dispatch = 'javac %'
    autocmd BufEnter * lua require'completion'.on_attach()
augroup end

function RunPython()
    execute 'update %'
    execute '!python3 %'
endfunction

function TestPython()
    execute 'update %'
    execute "!python3 -m unittest discover -s . -p 'test_*.py'"
endfunction

function RunJava()
    execute 'update %'
    let b:filename_noextension = substitute(@%, ".java", "", "")
    if filereadable(b:filename_noextension . ".class")
        execute '!rm' b:filename_noextension . ".class"
    endif
    execute '!javac -g %'
    let b:filename_noextension = substitute(@%, ".java", "", "")
    execute '!java' b:filename_noextension
endfunction

let s:clip = '/mnt/c/Windows/System32/clip.exe'
filetype indent off " else double indents must be after call plug#end
