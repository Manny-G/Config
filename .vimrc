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
set hlsearch

set tabstop=4
set shiftwidth=4
set expandtab

set path+=**
set wildmenu
command! MT !ctags -R .

nnoremap tn :tabnew<space>
nnoremap <C-N> :tabnext<CR>
nnoremap <C-P> :tabprev<CR>

autocmd FileType c,cpp,rust     let b:comment_leader = '// '
autocmd FileType python,sh      let b:comment_leader = '# '
autocmd FileType tex,matlab     let b:comment_leader = '% '
autocmd FileType vim            let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> .c :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
