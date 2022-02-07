" How to install 'vim-plug', read from https://github.com/junegunn/vim-plug/wiki/tutorial#setting-up


" Plugins will be downloaded under specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare list of plugins here...
Plug 'tpope/vim-sensible'

" Colorscheme
Plug 'morhetz/gruvbox'

" status line
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" LSP & code completion engine
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'vimwiki/vimwiki'

" Telescope - fuzzy finder & more
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


" List ends here. Plugins become visible to Vim after this call
call plug#end()
