inoremap jk <Esc>
nnoremap <leader>w :update<cr>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>o :set nohlsearch!<CR>

" quick fix list
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>' :copen<CR>

" no cut
vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>s "_d
vnoremap <leader>s "_d

" completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" navigate panes
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
