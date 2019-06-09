filetype on
syntax enable
set term=screen-256color
colorscheme darcula
set nocompatible

set autoindent
set number
set mouse=a
set matchpairs+=<:>

set tabstop=4
set shiftwidth=4
set expandtab

set path+=**
set wildmenu

nnoremap nt :tabnew<space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>

