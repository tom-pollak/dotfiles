let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
highlight link CocErrorSign GruvboxRed
highlight Normal guibg=none
highlight LineNr guifg=#ff8659