let mapleader = " "

let g:python3_host_prog = '/usr/bin/python3'

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
" let g:completion_matching_smart_case = 1
" let g:completion_enable_snippet = 'vim-vsnip'
"
" let g:completion_chain_complete_list = {
"     \ 'default': [
"         \ { 'complete_items':  ['lsp', 'buffers', 'tags', 'snippet', 'tabnine'] },
"     \ { 'mode': '<c-p>' },
"     \ { 'mode': '<c-n>' }
"     \]
" \}

lua require'nvim-treesitter.configs'.setup {
    \ ensure_installed = "maintained",
    \ highlight = { enable = true},
    \ rainbow = { enable = true },
    \ indent = { enable = true }
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

" let g:pear_tree_smart_openers = 1
" let g:pear_tree_smart_closers = 1
" let g:pear_tree_smart_backspace = 1
" let g:pear_tree_map_special_keys = 0
"
" let g:float_preview#docked = 1

" imap <BS> <Plug>(PearTreeBackspace)
" imap jk <Plug>(PearTreeFinishExpansion)

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
    autocmd BufEnter * lua require'compe'
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
" filetype indent off " else double indents must be after call plug#end
"
let g:gitgutter_max_signs = 0

highlight link CompeDocumentation NormalFloat
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
" let g:compe.source.tabnine = {}
" let g:compe.source.tabnine.max_line = 1000
" let g:compe.source.tabnine.max_num_results = 6
" let g:compe.source.tabnine.priority = 0
" let g:compe.source.tabnine.show_prediction_strength = v:true
