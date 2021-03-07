call plug#begin('~/.vim/plugged')

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'steelsojka/completion-buffers'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'nvim-treesitter/completion-treesitter'

" snippets
Plug 'SirVer/ultisnips'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Plug 'rust-lang/rust.vim'
" Plug 'tweekmonster/gofmt.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'

Plug 'vim-utils/vim-man'
Plug 'vuciv/vim-bujo'
Plug 'tomtom/tcomment_vim'
Plug 'honza/vim-snippets'
Plug 'lilydjwg/colorizer'
Plug 'p00f/nvim-ts-rainbow'

Plug 'tpope/vim-surround'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" prettier
Plug 'sbdchd/neoformat'
Plug 'tmsvg/pear-tree'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sunaku/tmux-navigate'
call plug#end()

let mapleader = " "
filetype plugin indent on

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:completion_matching_smart_case = 1
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_chain_complete_list = {
            \ 'default': {
            \   'default': [
            \       { 'complete_items':  ['lsp', 'buffers', 'snippet', 'ts', 'tabnine'] },
            \       { 'mode': '<c-p>' },
            \       { 'mode': '<c-n>' }]
            \   }
            \}

autocmd BufEnter * lua require'completion'.on_attach()

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

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_map_special_keys = 0

imap <BS> <Plug>(PearTreeBackspace)
imap jk <Plug>(PearTreeFinishExpansion)
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Plug>(PearTreeExpand)"

" nerdtree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

autocmd FileType java let b:dispatch = 'javac %'

augroup fmt
    autocmd!
    au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

