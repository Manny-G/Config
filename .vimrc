" autoload Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Plug 'junegunn/fzf'
call plug#end()

" Ale settings
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:airline#extensions#ale#enabled = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|target|build$',
  \ 'file': '\v\.(exe|so|dll|o|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" My settings
filetype on
syntax enable
set nocompatible

" Color settings
let g:airline_theme='base16_eighties'
let base16colorspace=256
colorscheme base16-eighties
set termguicolors
" set t_Co=256
" set background=dark
" hi Normal guibg=NONE ctermbg=NONE " Clear background
" hi NonText guibg=NONE ctermbg=NONE " Clear background

" Usability settings
set autoindent
set number
set mouse=a
set matchpairs+=<:>
set hlsearch
set relativenumber

" Spacing settings
set tabstop=4
set shiftwidth=4
set expandtab

" Allow find to do fuzy search (built-in CtrlP)
set path+=**
set wildmenu
set wildignore=*.settings,*.swp,*.o,*.git,*/tmp/*,*.so,*.zip

" Commands I run often enough
command! MT !ctags -R .
command! RD !xclip -sel clip -o
nmap ,RT :RustTest<CR>

" Keep undo history
set undodir=~/.vim/undo/
set undofile

" Splits in the direction they logically should be
set splitbelow
set splitright

" Shortcuts for smoother flow
nnoremap ,t :tabnew<space>
vnoremap < <gv
vnoremap > >gv
inoremap <C-O> <Esc>o
inoremap <C-H> <Left>
inoremap <C-L> <Right>
nnoremap <C-H> ^
nnoremap <C-L> $
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprev<CR>
nnoremap <S-Left> :-tabmove<CR>
nnoremap <S-Right> :+tabmove<CR>

" Remap arrow keys to not do funky things
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

" Built-in commenting code
autocmd FileType c,cpp,rust         let b:comment_leader = '// '
autocmd FileType python,sh,cmake    let b:comment_leader = '# '
autocmd FileType tex,matlab         let b:comment_leader = '% '
autocmd FileType vim                let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Built-in code completion
autocmd FileType rust inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType rust nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
" general
autocmd FileType rust inoremap ,p println!("");<Esc>2hi
autocmd FileType rust inoremap ,br <++>{<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,sbr <++>{<Enter><++><Enter>};<Esc>2k/<++><Enter>"_c4l
" data types
autocmd FileType rust inoremap ,fn fn () {<Enter><++><Enter>}<Esc>2kf(i
autocmd FileType rust inoremap ,e enum <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,mt match <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,smt match <++> {<Enter><++><Enter>};<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,st struct <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,im impl <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,tr trait <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,md mod <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
" public
autocmd FileType rust inoremap ,pfn pub fn () {<Enter><++><Enter>}<Esc>2kf(i
autocmd FileType rust inoremap ,pst pub struct <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,pmd pub mod <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,ptr pub trait <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
" loops
autocmd FileType rust inoremap ,for for <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,wh while <++> {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType rust inoremap ,lp loop {<Enter><Enter>}<Esc>1ki<tab>

autocmd FileType cpp inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType cpp nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
" general
autocmd FileType cpp inoremap ,p std::cout << "" << std::endl;<Esc>F"i
autocmd FileType cpp inoremap ,br <++>{<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,sbr <++>{<Enter><++><Enter>};<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,fn (<++>) {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
" loop
autocmd FileType cpp inoremap ,for for (<++>) {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,wh while (<++>) {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
" conditional
autocmd FileType cpp inoremap ,if if (<++>) {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,ei else if (<++>) {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,el else {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,sw switch (<++>) {<Enter><++><Enter>}<Esc>2k/<++><Enter>"_c4l
" OO
autocmd FileType cpp inoremap ,cl class <++> {<Enter><++><Enter>};<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,st struct <++> {<Enter><++><Enter>};<Esc>2k/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,tem template <typename <++>><Esc>2k/<++><Enter>"_c4l

