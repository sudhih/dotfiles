set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle & initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" use when using Vim on Windows
" call vundle#begin('~\Vim\vimfiles\bundle')

" let Vundle manage Vundle, required
Plugin 'Vundle/Vundle.vim'
 
" Color schemes
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'

" file browse
Plugin 'scrooloose/nerdtree'

" code completion engine for Vim
Plugin 'Valloric/YouCompleteMe'

" All of your plugins must be added before the following line
call vundle#end()		" required
filetype on
filetype plugin indent on	" required

"show line numbers
set nu

set termguicolors

" access colors present in 256 color space
let base16colorspace=256

" set default colorscheme for vim
colorscheme base16-default-dark

" highlight cursor line
set cursorline

" split occurs in below part of the screen
set splitbelow
set splitright

" breifly jump cursor to matching bracket, when a bracket is inserted
set showmatch

" load key-mappings
source ~/dotfiles/mappings.vim
