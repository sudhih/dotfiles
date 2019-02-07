set nocompatible		" be iMproved, required
"filetype off
"set t_Co=256

" set the runtime path to include Vundle & initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" use when using Vim on Windows
" call vundle#begin('~\Vim\vimfiles\bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
 
" Color schemes
Plugin 'chriskempson/base16-vim'

" python-mode
"Plugin 'python-mode/python-mode'

" jedi-vim
"Plugin 'davidhalter/jedi-vim'

" file browse
"Plugin 'scrooloose/nerdtree'

" easy (un)commenting 
Plugin 'tpope/commentary'
" linting engine
"Plugin 'w0rp/ale'

" code completion engine for Vim
"Plugin 'Valloric/YouCompleteMe'

" All of your plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

"show line numbers & relative numbers
set number relativenumber
let mapleader = ","

set termguicolors

" access colors present in 256 color space
"let base16colorspace=256

" set default colorscheme for vim
colorscheme base16-monokai

" highlight cursor line
set cursorline

" split occurs in below part of the screen
set splitbelow
set splitright

" breifly jump cursor to matching bracket, when a bracket is inserted
set showmatch
" start searching before pressing ENTER
set incsearch
" use '*' register for all yank, delete, put & change operations. 
" which can be explicitly accessed using quotestar("*). this enables
" copy-paste operations seemless accross appliaction
set clipboard=unnamed

" set color column to highlight recommended text width, though text can cross
set colorcolumn=80

" remember previous line's indentation & use the same for new line
set smartindent

" close buffer
map <Leader>q	<ESC>:q<CR>

" switch to nornal mode
imap <Leader>e	<ESC>
vmap <Leader>e	<ESC>

" write buffer to disk
map <Leader>w	<ESC>:w<CR>
imap <Leader>w	<ESC>:w<CR>
" save & exit
map <Leader>x	<ESC>:x<CR>
imap <Leader>x	<ESC>:x<CR>
" pymode variables
"let g:pymode_rope_completion = 0
"let g:pymode_rope_completion_bind = '<C-Space>'
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_autoimport = 0
"let g:pymode_rope_autoimport_import_after_complete = 0

" Jedi-vim variables
"let g:jedi#use_splits_not_buffers = 'winwidth'
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0
" load key-mappings
