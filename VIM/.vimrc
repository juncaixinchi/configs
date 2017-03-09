set nocompatible              " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
" use the command below to install the plugins from the command line
" vim +PluginInstall +qall

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" jsx
let g:jsx_ext_required = 0

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_w = 0

" fold
set foldmethod=indent
set foldlevelstart=99
" set foldlevel=0
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


" auto mkview & loadview
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

" indent set tab = 2 blank space
set ts=2
set sw=2
set expandtab
set smartindent
set number


