"====================================="
"  _       _ _         _              "
" (_)_ __ (_) |___   _(_)_ __ ___     "
" | | '_ \| | __\ \ / / | '_ ` _ \    "
" | | | | | | |_ \ V /| | | | | | |   "
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|   "
"                                     "
"====================================="
if exists('g:vscode')
  call plug#begin('~/.local/share/vscode-nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  call plug#end()

  let mapleader = ","
else
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ptzz/lf.vim'
  Plug 'voldikss/vim-floaterm'
  Plug 'itchyny/lightline.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'ap/vim-buftabline'
  Plug 'sbdchd/neoformat'
  Plug 'vim-crystal/vim-crystal'
  Plug 'elixir-editors/vim-elixir'
  call plug#end()

  " General Settings --------------------------
  let mapleader = ","
  set termguicolors
  colorscheme onedark
  set number relativenumber
  set noshowmode      " doubles up with lightline
  set hidden
  set wildmode=longest:full,full
  let g:lightline = {
        \ 'colorscheme': 'onedark',
        \ }

  " Behavior Modification ----------------------
  set ignorecase
  set smartcase
  set nohlsearch
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set splitbelow splitright
  set backupcopy=yes
  set scrolloff=10
  let loaded_matchparen = 1
  let g:lf_replace_netrw = 1
  let g:floaterm_width = 0.7
  let g:floaterm_height = 0.7
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  " disables auto-comment

  " Keybindings ----------------------
  noremap <leader>w :w<cr>
  nnoremap <C-N> :bnext<CR>
  nnoremap <C-P> :bprev<CR>
  inoremap <C-J> <ESC>ji
  noremap <F4> :set hlsearch! hlsearch?<CR>
  nnoremap q: <nop>
  nnoremap Q <nop>
  let g:floaterm_keymap_toggle = '<Leader>t'
  nnoremap gd :lua vim.lsp.buf.hover()<CR>
  noremap <leader>g :Goyo<CR>

  " Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  " Move a line of text using ALT+[jk]
  nmap <M-j> mz:m+<cr>`z
  nmap <M-k> mz:m-2<cr>`z
  vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

  " Neoformat 
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END

  " lsp settings
  lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
  lua require'lspconfig'.svelte.setup{on_attach=require'completion'.on_attach}
  lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
  lua require'lspconfig'.rls.setup{on_attach=require'completion'.on_attach}

  " Use <Tab> and <S-Tab> to navigate through popup menu
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " Set completeopt to have a better completion experience
  set completeopt=menuone,noinsert,noselect
  " Avoid showing message extra message when using completion
  set shortmess+=c

  " nvim-treesitter
  lua <<EOF
  require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,              
  },
}
EOF
endif

