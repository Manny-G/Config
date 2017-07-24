syntax on
set autoindent
set mouse=a
set number
set tabstop=4
set shiftwidth=4
set matchpairs+=<:>

nnoremap r <C-R>

filetype on

if &term =~ '256color'

	set term=screen-256color
	set t_ut=
	set background=dark
	
	"let g:solarized_termcolors=256
	"colorscheme solarized

endif
