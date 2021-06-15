vim.g.mapleader = ' '

vim.cmd 'syntax on'

require'general-options'
require'general-keybinds'

-- for the coloured (){}[]
vim.g.rainbowactive = true

require'plugins'

if not vim.g.vscode then
	require'lsp'
    require'lsp-keybinds'

    --rainbow [](){}
    vim.g.rainbow_active = true
    vim.g.rainbow_conf = { guifgs = { 'Yellow', 'LightMagenta', 'LightBlue'} }

    --fzf
    vim.g.fzf_layout = { window = { width = 0.8,  height = 0.8 } }
    vim.env.FZF_DEFAULT_OPTS = '--reverse'

    -- find files -- will ignore files specified in .gitignore
    Keymap_silent('n', '<leader>ff', '<cmd>GFiles<CR>')
    -- find files
    Keymap_silent('n', '<leader>fg', '<cmd>Files<CR>')
    -- find windows
    Keymap_silent('n', '<leader>fw', '<cmd>Windows<CR>')
    --find buffers
    Keymap_silent('n', '<leader>fb', '<cmd>Buffers<CR>')
    --find command
    Keymap_silent('n', '<leader>fc', '<cmd>Commands<CR>')
    --find colortheme
    Keymap_silent('n', '<leader>ft', '<cmd>Colors<CR>')

    -- make sure any js file gets formatted
    vim.cmd 'autocmd BufWritePre *.mjs,*.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_sync(nil, 100)'

	require'discord'

    require'treesitter-config'

end

vim.cmd 'colorscheme ayu'

