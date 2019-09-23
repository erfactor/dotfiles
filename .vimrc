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
nnoremap ? ?\v\c
vnoremap ? ?\v\c

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
nnoremap <space> @q
" Commands
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a
nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

"Registers
let @r='%s/\v\c(public|private).*\(.*\)$\n.*\{/\=submatch(0) . "\n         Tizen.Log.Verbose(\"tag\",\"" . substitute(submatch(0),''\v\n.*\{'','''',''g'') . "\");"'
"Mein Commanden
command! Logs %s/\v\c(public|private).*\(.*\)$\n.*\{/\=submatch(0) . "\n         Tizen.Log.Verbose(\"tag\",\"" . substitute(submatch(0),'\v\n.*\{','','g') . "\");"
command! Inba %s/a/x/g
