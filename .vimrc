filetype on
syntax enable
" set term=screen-256color " Win Bash
set t_Co=256 " Linux Bash
" set background=dark " Linux Bash
" colorscheme darcula
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
inoremap <C-O> <Esc>o
inoremap <C-H> <Left>
inoremap <C-L> <Right>
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

autocmd FileType c,cpp,rust         let b:comment_leader = '// '
autocmd FileType python,sh,cmake    let b:comment_leader = '# '
autocmd FileType tex,matlab         let b:comment_leader = '% '
autocmd FileType vim                let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

autocmd FileType python inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType python nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType python inoremap ,fn def ():<Enter><Tab><++><Esc>1kF(i
autocmd FileType python inoremap ,afn async def ():<Enter><Tab><++><Esc>1kf(i
autocmd FileType python inoremap ,cl class ():<Enter><Tab><++><Esc>1kF(i
autocmd FileType python inoremap ,p print(f'')<Esc>F'i

autocmd FileType rust inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l<Tab>
autocmd FileType rust nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l<Tab>
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

autocmd FileType cpp inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l<Tab>
autocmd FileType cpp nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l<Tab>
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
