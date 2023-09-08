" Default commands
set number
set nowrap
set cul
" set relativenumber
set incsearch
"set hlsearch
"nmap ,, :noh<CR>

" Scrolloff
set so=5
" Use very magic and case insensitive search patterns
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap } /\v^\s*$<cr>
nnoremap { ?\v^\s*$<cr>
vnoremap y ygv<esc>

vnoremap my "+y
nnoremap mp "+p
vnoremap mp "+p

map D dd
map Z zz
map U uuu
" Helpers
nnoremap mw dawea<space><esc>p
nnoremap mc v%o
nnoremap md $V%o^
" nnoremap md $?[\{\(\[]<enter>%Vo^
noremap <c-j> 5j
noremap <c-k> 5k
inoremap jk <esc>

" Indenting stuff. Remember about 'set shiftwidth'
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

vnoremap > >gv
vnoremap < <gv
nnoremap <Tab> >> 
nnoremap <S-Tab> << 
inoremap <S-Tab> <C-D>
vmap <Tab> >
vmap <S-Tab> <

" Flutter helpers
nnoremap mim miggOimport 'package:flutter/material.dart';<esc>`i
nnoremap mic miggOimport 'package:firebase_chat/presentation/widget/basic/basic.dart';<esc>`i

" Fancy mappings
nnoremap <space> @q
" Commands
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a
nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

" Log
let @r='%s/\v\c(public|private|protected).*\(.*\)$\n.*\{/\=submatch(0) . "\n         log(\"tag\",\"" . substitute(submatch(0),''\v\n.*\{'','''',''g'') . "\");"'
command! Logs %s/\v\c(public|private|protected).*\(.*\)$\n.*\{/\=submatch(0) . "\n         log(\"tag\",\"" . substitute(submatch(0),'\v\n.*\{','','g') . "\");"
" Commands
" command! Sample %s/a/x/g
command! Df !dart fix --apply %

" Quit
nnoremap <c-q> :x<cr>

set nocompatible
set hidden
syntax on
filetype indent plugin on
set wildmenu
set showcmd
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set mouse=a
set visualbell
set t_vb=
