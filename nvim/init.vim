call plug#begin('~/.vim/plugged')

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'

Plug 'tzachar/compe-tabnine', {'do': './install.sh' }

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kitagry/vs-snippets'

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
Plug 'airblade/vim-gitgutter'

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

Plug 'sbdchd/neoformat'
Plug 'cohama/lexima.vim'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sunaku/tmux-navigate'
Plug 'milkypostman/vim-togglelist'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()
