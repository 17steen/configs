syntax on

set exrc
set noerrorbells
set relativenumber
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup

set undodir=~/.config/nvim/undodir
set undofile

set termguicolors
set scrolloff=8

set noshowmode

set completeopt=menuone,noinsert,noselect

set shortmess+=c

set signcolumn=yes

set cmdheight=2

set updatetime=50

set incsearch
set expandtab
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightrey


call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()


colorscheme gruvbox
set background=dark

let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>

"" in order to use completion with tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"




let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
