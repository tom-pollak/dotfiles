inoremap jk <Esc>
nnoremap <leader>w :update<cr>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>o :set nohlsearch!<CR>

" quick fix list
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" no cut
vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>s "_d
vnoremap <leader>s "_d

" completion
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" navigate panes
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

imap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<CR>'
smap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<CR>'

" Jump forward or backward
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
imap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
smap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'

nnoremap Y y$

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

" completion
inoremap <silent><expr> <CR> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <Tab>     compe#scroll({delta': +4 })
inoremap <silent><expr> <S-Tab>     compe#scroll({delta': -4 })

" Keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap j mzJ`z

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moving text
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
