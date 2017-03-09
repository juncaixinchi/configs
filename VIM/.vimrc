set nocompatible              " be iMproved, required
filetype on                   " required
filetype indent on

syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
	
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'

set number

" fold
set foldmethod=indent
set foldlevelstart=99
" set foldlevel=0
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" indent
set autoindent 
set smartindent

" auto mkview & loadview
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

" set tab = 2 blank space
set ts=2
set sw=2
set expandtab autoindent
