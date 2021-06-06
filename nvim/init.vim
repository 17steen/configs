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

set scrolloff=8

set noshowmode

set wildmode=longest,list,full
set shortmess+=c
set completeopt=menuone,noinsert,noselect

set signcolumn=yes

set cmdheight=2

set updatetime=50

set incsearch
set expandtab
set colorcolumn=80

set termguicolors
highlight ColorColumn ctermbg=0 guibg=lightrey

let g:asmsyntax = 'nasm'

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'elmcast/elm-vim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'rhysd/vim-clang-format'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'luochen1990/rainbow'

Plug 'ayu-theme/ayu-vim'

Plug 'ARM9/arm-syntax-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } 

Plug 'andweeb/presence.nvim'

call plug#end()

let g:livepreview_engine = 'xelatex'

let g:rainbow_active = 1

let g:clang_format#code_style = "Mozilla"

autocmd FileType h,c,cpp,hpp ClangFormatAutoEnable
"""autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.mjs,*.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_sync(nil, 100)

""tells vim that .s files are going to use arm syntax
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

let g:firenvim_config = { 'takeover': 'always' }

let ayucolor="dark"
colorscheme ayu
"set background=dark

let mapleader = " "

""bépo specific
noremap é %
lnoremap ’ '
""C-^ does not exist and C-é doesn't work
noremap <Space>é <C-^>

""quicksave
nnoremap <leader>w :w<CR>

if !exists('g:vscode')

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>u :UndotreeShow<CR>
"" don’t use it really
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>

"" fzf
nnoremap <silent> <leader>f <cmd>Files<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"" disable annoying highlight after a search :
nnoremap <silent><leader>n <cmd>noh<CR>

endif


"" in order to use completion with tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"" copy to clipboard (if available)
nnoremap <leader>y "+y
vnoremap <leader>y "+y

"" paste from clipboard (if available)
nnoremap <leader>p "+p
vnoremap <leader>p "+p


if !exists('g:vscode')

let g:rainbow_conf = {'guifgs': ['Yellow', 'LightMagenta', 'LightBlue']}
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

luafile ~/.config/nvim/lsp.lua

""help
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

""go to defintition 
nnoremap <silent><leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
""go to implementiation
nnoremap <silent><leader>gD <cmd>lua vim.lsp.buf.implementation()<CR>
""go to type
nnoremap <silent><leader>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
""go to references
nnoremap <silent><leader>grr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>grn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>ge <cmd>lua vim.lsp.buf.signature_help()<CR>

""show diagnostics line
nnoremap <silent><leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

""format
nnoremap <silent><leader>s <cmd>w<CR><cmd>lua vim.lsp.buf.formatting()<CR>

""switch between headers c++
nnoremap <silent><leader>c <cmd>ClangdSwitchSourceHeader<CR>

endif

