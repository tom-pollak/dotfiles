fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

set runtimepath^=~/.vim runtimepath+=~/.vim/after
set modifiable

set noshowmode
set exrc
set autoindent
set relativenumber nu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set hidden
set nowrap
set ignorecase smartcase
set noswapfile
" set nobackup
set undodir=~/.vim/undordir
set undofile
set undolevels=10000
set incsearch
set scrolloff=8
set cmdheight=2
set shortmess+=c
set updatetime=50
set signcolumn=yes
filetype plugin indent on
set backspace=indent,eol,start
set swapfile
set dir=~/.swp
set backupdir=~/.tmp

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

inoremap jk <esc>
map Y y$

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'miki725/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tomtom/tcomment_vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'honza/vim-snippets'
" Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
Plug 'p00f/nvim-ts-rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'joelbeedle/pseudo-syntax'
Plug 'kassio/neoterm'
Plug 'szymonmaszke/vimpyter'
Plug 'vim-test/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'pwntester/octo.nvim'
" Plug 'goerz/jupytext'
call plug#end()

" vim test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:gruvbox_italic=1
colorscheme gruvbox
highlight link CocErrorSign GruvboxRed
let g:gruvbox_contrast_dark = 'hard'
set background=dark
let mapleader = " "

let g:python3_host_prog = '/usr/bin/python3'

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" COC extensions
            " \'coc-python',
let g:coc_global_extensions = [
            \'coc-markdownlint',
            \'coc-highlight',
            \'coc-vetur',
			\'coc-jedi',
            \'coc-flutter',
            \'coc-json',
            \'coc-git',
            \'coc-clangd',
			\'coc-diagnostic',
            \'coc-css',
            \'coc-eslint',
            \'coc-html',
            \'coc-rls',
            \'coc-sh',
            \'coc-sql',
            \'coc-snippets',
            \'coc-tsserver',
            \'coc-xml',
            \'coc-prettier',
            \'coc-pairs',
			\'coc-highlight',
			\'coc-java',
			\'coc-java-debug'
            \]
let g:coc_disable_transparent_cursor = 1

" rip grep
if executable('rg')
    let g:rg_derive_root='true'
    let g:rg_highlight='true'
endif

let g:rainbow_active = 1

" telescope
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"
" let g:netrw_browse_split = 2
" let g:netrw_banner = 0
" let g:netrw_winsize = 25

lua require('telescope').load_extension('octo')
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-b> :lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>


lua require'nvim-treesitter.configs'.setup {
			\ ensure_installed = "maintained",
			\ highlight = { enable = true},
			\ rainbow = { enable = true },
			\ }
"
" split windows
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

"other remaps
nnoremap <leader>u :UndotreeShow<CR>:wincmd h<CR>
nnoremap <leader>o :set nohlsearch!<CR>

autocmd BufNewFile,Bufread *.py nnoremap <leader>rr :update<cr>:split term://python3 %<cr><c-w>J:resize 22<cr>i
autocmd BufNewFile,Bufread *.py nnoremap <leader>rt :update<cr>:split term://python3 -m unittest discover -s . -p 'test_*.py'<cr><c-w>J:resize 22<cr>i
autocmd BufNewFile,Bufread *.java nnoremap <leader>rr :call RunJava()<cr>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

"stuff don't really use yet
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"COC remaps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>w :update<cr>

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

if exists('*complete_info')
    inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vim easy motion
nmap <leader>s <Plug>(easymotion-overwin-f2)
nmap <leader>f <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

nmap M <Plug>(easymotion-w)

" nerdtree
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

:tnoremap <Esc> <C-\><C-n>

function! GetTermWidth()
    " if winwidth(0) < 163
    "   return winwidth(0) - 83
    " endif
    " should be / 2
    let width = (winwidth(0) -3)
    :execute 'echo' . width
    return width
endfunction

if winwidth(0) - 3 > 113
    nnoremap <leader>t :vsplit term://zsh<cr><c-w>L:execute 'vertical resize' . GetTermWidth()<cr>i
else
    nnoremap <leader>t :split term://zsh<cr><c-w>J:resize 22<cr>i
endif



" vimspector
nnoremap <leader>ddd :call vimspector#Launch()<CR>

nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint

command! -nargs=0 Format :call CocAction('format')

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

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP"

autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>r :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

let g:jupytext_enable = 1
let g:jupytext_command = 'jupytext'

nmap m <Plug>(easymotion-overwin-f)
