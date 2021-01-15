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

Plug 'rhysd/vim-clang-format'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'luochen1990/rainbow'

call plug#end()

let g:rainbow_active = 1

let g:clang_format#code_style = "Mozilla"

autocmd FileType c,cpp,hpp ClangFormatAutoEnable

let g:firenvim_config = { 'takeover': 'always' }

colorscheme gruvbox
set background=dark

let mapleader = " "



""bépo specific
nnoremap é %


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

"" fzf
nnoremap <silent> <leader>f <cmd>Files<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'


"" in order to use completion with tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"" copy to clipboard (if available)
nnoremap <leader>y "+y
vnoremap <leader>y "+y

inoremap <C-Space> <cmd>Files<CR>
inoremap <C-@> <C-Space>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.sumneko_lua.setup { 
    \cmd = {"/home/steen/Programming/Utilities/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/steen/Programming/Utilities/lua-language-server/main.lua"};
    \on_attach=require'completion'.on_attach;
    \settings = {
        \Lua = {
            \runtime = {
                \version = 'LuaJIT', 
                \path = vim.split(package.path, ';'),
            \},
            \diagnostics = { globals = {'vim'},},
            \workspace = {
                \library = {
                    \[vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    \[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                \},
            \},
        \},
    \},
\}

let g:rainbow_conf = {'guifgs': ['Yellow', 'LightMagenta', 'LightBlue']}

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

""show diagnostics line
nnoremap <silent><leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

""format
nnoremap <silent><leader>s <cmd>w<CR><cmd>lua vim.lsp.buf.formatting()<CR>

