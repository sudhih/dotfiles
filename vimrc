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
colorscheme base16-macintosh
"colorscheme murphy

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
set clipboard="unnamed"

" set color column to highlight recommended text width, though text can cross
set colorcolumn=80

" remember previous line's indentation & use the same for new line
set smartindent

" help 'gf' goto-file command look into sub-dirs of working dir too
" ** value to expand sub directories
set path+=**
" -------- MAPPINGS --------
" close buffer
map <Leader>q	<ESC>:q<CR>
" quit buffer without saving
map <Leader>Q	<ESC>:q!<CR>
" switch to nornal mode
imap <Leader>e	<ESC>
vmap <Leader>e	<ESC>
" write buffer to disk
map <Leader>w	<ESC>:w<CR>
imap <Leader>w	<ESC>:w<CR>
" save & exit
map <Leader>x	<ESC>:x<CR>
imap <Leader>x	<ESC>:x<Enter>
" navigate tabs
map <Leader>t <ESC>:tabnext<CR>
imap <Leader>t <ESC>:tabnext<CR>
map <Leader>tt <ESC>:tabprevious<CR>
imap <Leader>tt <ESC>:tabprevious<CR>

" markdown
autocmd filetype markdown :map <CR> 02li__DONE__ <ESC>
autocmd filetype markdown :iabbrev <CR> - 

" help file navigations
autocmd filetype help map <cr> <c-]>
autocmd filetype help map <buffer><bs> <c-t>
" maximize help window on open
autocmd filetype help wincmd _
" -------- Abbreviations --------
autocmd filetype javascript :iabbrev cdl console.log
autocmd filetype dosini :set commentstring=''
autocmd filetype dosini :set commentstring='#%s'

" -------- Folding ----------
autocmd filetype python set foldmethod=indent
autocmd filetype python set foldcolumn=2
autocmd filetype dosini set foldmethod=marker
autocmd filetype dosini set foldcolumn=2
au BufWrite *.js :silent exec '!tmux send-keys -Rt 1 C-l "node %" Enter' | redraw!
"au BufWrite *.py :silent exec '!tmux send-keys -Rt 1 C-l "python %" Enter' | redraw!

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore
augroup END
