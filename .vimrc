filetype on
syntax enable
set term=screen-256color " Win Bash
"set t_Co=256 " Linux Bash
"set background=dark " Linux Bash
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
command! MT !ctags -R .

nnoremap nt :tabnew<space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>

