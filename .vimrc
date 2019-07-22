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

autocmd FileType html inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType html nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType html inoremap ,ht <html><\html><Enter><++><Esc>1kf<i
autocmd FileType html inoremap ,he <head><\head><Enter><++><Esc>1kf<i
autocmd FileType html inoremap ,t <title><\title><Enter><++><Esc>1kf<i

autocmd FileType python inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType python nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType python inoremap ,fn def ():<Enter><Tab><++><Esc>1kF(i
autocmd FileType python inoremap ,afn async def ():<Enter><Tab><++><Esc>1kf(i
autocmd FileType python inoremap ,cl class ():<Enter><Tab><++><Esc>1kF(i
autocmd FileType python inoremap ,p print(f'')<Esc>F'i

autocmd FileType javascript inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l<Tab>
autocmd FileType javascript nnoremap <Tab><Space> <Esc>/<++><Enter>"_c4l<Tab>
autocmd FileType javascript inoremap ,p console.log();<Esc>1hi
autocmd FileType javascript inoremap ,if if () {<Enter><++><Enter>}<Esc>2kf)i
autocmd FileType javascript inoremap ,ei else if () {<Enter><++><Enter>}<Esc>2kf)i
autocmd FileType javascript inoremap ,el else () {<Enter><++><Enter>}<Esc>2kf)i
autocmd FileType javascript inoremap ,for for () {<Enter><++><Enter>}<Esc>2kf)i
autocmd FileType javascript inoremap ,wh while () {<Enter><++><Enter>}<Esc>2kf)i
autocmd FileType javascript inoremap ,dwh do {<Enter><Enter>} while (<++>);<Esc>1ki<Tab>
autocmd FileType javascript inoremap ,sw switch () {<Enter><++><Enter>}<Esc>2kf)i
autocmd FileType javascript inoremap ,fn function () {<Enter><++><Enter>}<Esc>2kf(i
a
