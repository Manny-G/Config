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
Plug 'junegunn/vim-easy-align'
call plug#end()

" Ale settings
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:airline#extensions#ale#enabled = 1

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir'  : '\v[\/]\.(git|hg|svn)|target|build$',
  \ 'file' : '\v\.(exe|so|dll|o|swp)$',
  \ 'link' : 'some_bad_symbolic_links',
  \ }

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Rust settings
let g:rustfmt_autosave = 1

" EasyAlign settigns
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
set background=dark
" hi Normal guibg=NONE ctermbg=NONE " Clear background
" hi NonText guibg=NONE ctermbg=NONE " Clear background

" Usability settings
set autoindent
set number
set mouse=a
set matchpairs+=<:>
set hlsearch
set incsearch
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
nnoremap ,p :ptjump <C-R><C-W><CR>
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

" Built-in commenting code
autocmd FileType c,cpp,rust         let b:comment_leader = '// '
autocmd FileType python,sh,cmake    let b:comment_leader = '# '
autocmd FileType tex,matlab         let b:comment_leader = '% '
autocmd FileType vim                let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
