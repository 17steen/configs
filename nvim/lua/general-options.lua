vim.cmd 'syntax on'

vim.o.exrc = true
vim.o.relativenumber = true
vim.o.hidden = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.number = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.showmode = false

vim.o.backup = false
vim.o.swapfile = false
vim.o.undodir="/home/steen/.config/nvim/undodir"
vim.o.undofile = true
vim.o.scrolloff = 8

vim.o.showmode = false

vim.o.wildmode = "longest,list,full"
vim.o.shortmess = vim.o.shortmess .. "c"


vim.o.completeopt = 'menuone,noinsert,noselect'

vim.o.signcolumn = "yes"
vim.o.cmdheight = 2

vim.o.updatetime = 50

vim.o.incsearch = true
vim.o.expandtab = true

vim.o.colorcolumn = "80"

vim.o.termguicolors = true

vim.g.asmsyntax = 'nasm'

