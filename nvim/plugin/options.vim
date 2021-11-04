let mapleader = " "

let g:python3_host_prog = '/usr/bin/python3'

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

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
    au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

augroup run_file
    autocmd!
    autocmd BufNewFile,Bufread *.py nnoremap <leader>rr :call RunPython()<CR>
    autocmd BufNewFile,Bufread *.py nnoremap <leader>rt :call TestPython()<CR>
    autocmd BufNewFile,Bufread *.c nnoremap <leader>rr :call RunC()<cr>
augroup end

" nerdtree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif

function RunPython()
    execute 'update %'
    execute '!python3 %'
endfunction

function TestPython()
    execute 'update %'
    execute "!python3 -m unittest discover -s . -p 'test_*.py'"
endfunction

function RunC()
    execute 'update %'
    execute '!gcc % && ./a.out'
endfunction

let s:clip = '/mnt/c/Windows/System32/clip.exe'
" filetype indent off " else double indents must be after call plug#end
"
let g:gitgutter_max_signs = 0
