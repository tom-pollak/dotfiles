set relativenumber nu
set shortmess+=c
set hidden
set noerrorbells
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0
set ignorecase smartcase
set completeopt=menuone,noinsert,noselect

set dir=~/.swp
set backupdir=~/.tmp

set pastetoggle=<leader>q

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

set colorcolumn=80
augroup filetype_indent
    autocmd!
    autocmd FileType python setlocal colorcolumn=88
    autocmd FileType javascript,html,json,htmldjango,javascriptreact,typescript,typesciptreact,vue setlocal ts=2 sts=2 sw=2
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END