set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

set cindent
set smartindent
set ruler
set tabstop=4
set shiftwidth=4
set number
set nuw=1
set hlsearch
set ignorecase
set showmatch
syntax on
set fencs=ucs-bom,utf-8,euc-kr.latin1
filetype on
"set background=dark
set showmode
set ff=unix
set cul
set colorcolumn=81

"ctags
set tags=./tags
"cscope
if has('cscope')
	set csprg=/usr/bin/cscope
	set csto=0
	set cscopetag
	set nocsverb
	if filereadable("./cscope.out")
		cs add ./cscope.out
	endif
	set csverb
endif
nnoremap <silent> <F7> :TlistUpdate<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :TlistSync<CR>
nmap <F5> :!cscope -b -q<CR>
	\:cs reset<CR>
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme base16-default
set termguicolors
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
"au BufRead,BufNewFile *.R set filetype=r
"au BufRead,BufNewFile *.r set filetype=r
"set sessionoptions-=folds
"set sessionoptions-=options

