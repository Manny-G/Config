filetype on
syntax enable
" set term=screen-256color " Win Bash
set t_Co=256 " Linux Bash
" set background=dark " Linux Bash
colorscheme darcula
set nocompatible
" hi Normal guibg=NONE ctermbg=NONE " Clear background
" hi NonText guibg=NONE ctermbg=NONE " Clear background

set autoindent
set number
set mouse=a
set matchpairs+=<:>
set hlsearch
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab

set path+=**
set wildmenu
command! MT !ctags -R .

set splitbelow
set splitright

nnoremap ,t :tabnew<space>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprev<CR>
nnoremap <S-Left> :-tabmove<CR>
nnoremap <S-Right> :+tabmove<CR>
nnoremap <S-Up> k
nnoremap <S-Down> j
nnoremap <C-Up> k
nnoremap <C-Down> j
vnoremap <S-Up> k
vnoremap <S-Down> j
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
inoremap <C-Up> <ESC>:m-2<CR>i
inoremap <C-Down> <ESC>:m+1<CR>i

autocmd FileType c,cpp,rust     let b:comment_leader = '// '
autocmd FileType python,sh      let b:comment_leader = '# '
autocmd FileType tex,matlab     let b:comment_leader = '% '
autocmd FileType vim            let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

