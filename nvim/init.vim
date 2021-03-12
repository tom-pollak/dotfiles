call plug#begin('~/.vim/plugged')

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'ncm2/float-preview.nvim'

Plug 'steelsojka/completion-buffers'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'nvim-treesitter/completion-treesitter'
Plug 'kristijanhusak/completion-tags'

" snippets
Plug 'SirVer/ultisnips'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
Plug 'junegunn/vim-easy-align'

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
