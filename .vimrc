" Default commands
set number
set nowrap
set cul
set hlsearch
set incsearch

" Tab stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Use very magic and case insensitive search patterns
nnoremap / /\v\c
vnoremap / /\v\c

" Indenting stuff. Remember about 'set shiftwidth'
vnoremap > >gv
vnoremap < <gv
nnoremap <Tab> >> 
nnoremap <S-Tab> << 
inoremap <S-Tab> <C-D>
vmap <Tab> >
vmap <S-Tab> <

" Fancy mappings
imap <c-f> <ESC>@ti
nmap ,, :noh<CR>
