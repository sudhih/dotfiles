" replace default \ to ,
let mapleader = ","

" mappings for pair-characters
imap <Leader>{ {<CR>}<ESC>O
imap <Leader>( ()<ESC>i
imap <Leader>[ []<ESC>i
imap <Leader>' ''<ESC>i
imap <Leader>" ""<ESC>i

" when finished with typing arguments, literals etc. jump to end of bracket
imap <Leader>E <ESC>E
imap <Leader>W <ESC>W
imap <Leader>w <ESC>w
imap <Leader>e <ESC>e

" write file
imap <Leader>w <ESC>:w<CR>
map <Leader>w <ESC>:w<CR>

" save & quit
imap <Leader>q <ESC>:x<CR>
map <Leader>q <ESC>:x<CR>

" TODO:
" - find way for file-specific mapping
" - find way to define leader-key and have it defined

" html-tag wraps 
imap <Leader>i <i></i><ESC>F>a
imap <Leader>bd <b></b><ESC>F>a
imap <Leader>br </br><ESC>a

" Open NERDTree
map <C-N> :NERDTree<CR>

" Tab navigation 
nmap <Leader>d :tabprevious<CR>
nmap <Leader>f :tabnext<CR>
nmap <Leader>t :tabnew<CR>
nmap <Leader>tt :tabclose<CR>
imap <Leader>d <ESC>:tabprevious<CR>
imap <Leader>f <ESC>:tabnext<CR>
imap <Leader>t <ESC>:tabnew<CR>

" Window navigation
imap <Leader>j <ESC><C-W><C-H>

