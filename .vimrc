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

nnoremap ,t :tabnew<space>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprev<CR>
nnoremap <S-Up> {
nnoremap <S-Down> }
nnoremap <C-Up> :m-2<CR>
nnoremap <C-Down> :m+1<CR>
vnoremap <S-Up> {
vnoremap <S-Down> }
inoremap <S-Up> <ESC>{i
inoremap <S-Down> <ESC>}i

autocmd FileType c,cpp,rust     let b:comment_leader = '// '
autocmd FileType python,sh      let b:comment_leader = '# '
autocmd FileType tex,matlab     let b:comment_leader = '% '
autocmd FileType vim            let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

