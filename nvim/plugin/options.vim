let mapleader = " "

let g:python3_host_prog = '/usr/bin/python3'

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:completion_matching_smart_case = 1
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_chain_complete_list = {
    \ 'default': [
        \ { 'complete_items':  ['lsp', 'buffers', 'tags', 'snippet', 'tabnine'] },
    \ { 'mode': '<c-p>' },
    \ { 'mode': '<c-n>' }
    \]
\}


let g:UltiSnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

lua require'nvim-treesitter.configs'.setup {
    \ ensure_installed = "maintained",
    \ highlight = { enable = true},
    \ rainbow = { enable = true },
    \ }

let g:airline#extensions#tabline#enabled = 1

let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript  = ['prettier']
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1

autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.py Neoformat

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_map_special_keys = 0

let g:float_preview#docked = 1

imap <BS> <Plug>(PearTreeBackspace)
imap jk <Plug>(PearTreeFinishExpansion)
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<Plug>(PearTreeExpand)"


autocmd BufNewFile,Bufread *.py nnoremap <leader>rr :call RunPython()<CR>
autocmd BufNewFile,Bufread *.py nnoremap <leader>rt :call TestPython()<CR>
autocmd BufNewFile,Bufread *.java nnoremap <leader>rr :call RunJava()<cr>

    " nerdtree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif

autocmd FileType java let b:dispatch = 'javac %'

autocmd BufEnter * lua require'completion'.on_attach()

augroup fmt
autocmd!
"au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

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
if executable(s:clip)
    augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# '<leader>y' | call system(s:clip, @0) | endif
    augroup END
endif
filetype indent off " else double indents must be after call plug#end
