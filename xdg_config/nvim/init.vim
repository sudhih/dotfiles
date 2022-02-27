" map leader
let mapleader = ','

set number 
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set splitright splitbelow
set noswapfile
" set Neovim's clipboard so that it delegates win32yank.exe on WSL
" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
set clipboard=unnamedplus

" this is a comment added to test marks
" MAPPING {{{1
" basics {{{2
    nnoremap <leader>e <ESC>
    nnoremap <leader>w <ESC>:w<CR>
    inoremap <leader>e <ESC>
    inoremap <leader>w <ESC>:w<CR>
    " }}}2
" window jumps {{{2
    nnoremap <C-l> <C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    " }}}2
" Telescope {{{2
    " find in current buffers
    nnoremap <leader>b :Telescope buffers<CR>

    " find in Current dir
    nnoremap <leader>f :Telescope find_files<CR>
    " find in Office REPO
    nnoremap <leader>r :Telescope find_files cwd=~/winhome/source/Workspaces/AutomationProcess_29697/DEV<CR>
    " find in $XDG_CONFIG_HOME
    nnoremap <leader>c :Telescope find_files cwd=~/.config/<CR>
    " find in Vimwiki
    nnoremap <leader>v :Telescope find_files cwd=~/vimwiki<CR>

    " grep in Current dir
    nnoremap <leader>l :Telescope live_grep<CR>
    " grep in Vimwiki
    nnoremap <leader>k :Telescope live_grep cwd=~/vimwiki/<CR>
" }}}2
" }}}1

" {{{ IMPORTS

" Plugin lists are defined here
runtime ./plug.vim

" }}}

set mouse=a
set cursorline cursorcolumn
set background=dark
colorscheme gruvbox

lua << END 
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
END 

" vim_current_word plugin highlight group setting
hi CurrentWord ctermbg=237
hi CurrentWordTwins ctermbg=238


" {{{ `lualine` CONFIGURATION
lua << END
require('lualine').setup {
  options = {
    icons_enabled = false, -- set this to true when patched 'nerd fonts' are installed
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''}, -- set this with separators after you fonts
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
" }}}


" {{{ `nvim-lspconfig` CONFIGURATION
" source: https://github.com/neovim/nvim-lspconfig#quickstart

lua << EOF
-- require'lspconfig'.pyright.setup{}
EOF

" }}}


" {{{ `vimwiki` CONFIGURATION
let g:vimwiki_list = [{
			\'path': '/mnt/c/Users/sudhir.hanumanthappa/OneDrive - Accenture/vimwiki',
			\'ext': '.md',
			\'syntax': 'markdown',
			\'links_space_char': '_',
			\'diary_index': 'index'
	\}]

" use below fancy symbols instead of ' .oOX', default values to show
" progression of TODO list
let g:vimwiki_listsyms = ' ○◐●✓'
" mark an item in TODO list as 'will not be done'
   let g:vimwiki_listsym_rejected = '✗'
" use <br> for every new line, might get used when converting *.wiki to html?
let g:vimwiki_text_ignore_newline = 1
" enter markdown extention for the links
let g:vimwiki_markdown_link_ext = 1
" number of new lines after a HEADER 
let g:vimwiki_markdown_header_style = 2

" }}}


" {{{ `nvim-lspconfig` CONFIGURATION
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
" }}}


" {{{ `nvim-cmp` CONFIGURATION
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'pyright'},
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
       { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline('/', {
--    sources = {
--      { name = 'buffer' }
--    }
--  })
--
--  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['pyright'].setup {
--    -- on_attach = on_attach,
--    capabilities = capabilities
--  }
EOF
" }}}


" `nvim-telescope` {{{
lua << EOF
require('telescope').setup{
  -- ...
  defaults = {
      file_ignore_patterns = {
          ".*/__pycache__/", 
          "*.whl", 
          "file_encryptor[%a_]*/",
          "venv/",
          "build/",
          "dist/",
      }
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF
" }}}


" {{{ `tree-sitter` CONFIGURATION
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

EOF
"}}}
