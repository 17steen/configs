Keymap_expr = function (a, b, c)
	vim.api.nvim_set_keymap(a, b, c, {expr = true, noremap = true})
end

Keymap = function (a, b, c)
	vim.api.nvim_set_keymap(a, b, c, {expr = false, noremap = true})
end

Keymap_silent = function (a, b, c)
	vim.api.nvim_set_keymap(a, b, c, {expr = false, noremap = true, silent = true})
end

--bépo moment
Keymap('', 'é', '%')
Keymap('', '’', "'")
Keymap('', '<leader>é', '<C-^>')


Keymap('', '<leader>y', '"+y')
Keymap('', '<leader>p', '"+p')
Keymap('', '<leader>w', ':w<CR>')


if not vim.g.vscode then
	Keymap('n', '<leader>h', ':wincmd h<CR>')
	Keymap('n', '<leader>j', ':wincmd j<CR>')
	Keymap('n', '<leader>k', ':wincmd k<CR>')
	Keymap('n', '<leader>l', ':wincmd l<CR>')

	Keymap('n', '<leader>q', ':q<CR>')
	Keymap('n', '<leader>v', ':wincmd v<CR>')

	Keymap_silent('n', '<leader>+', ':vertical resize +5<CR>')
	Keymap_silent('n', '<leader>-', ':vertical resize -5<CR>')
	--
	Keymap('n', '<leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')

	--disable annoying highlighting
	Keymap_silent('n', '<leader>n', '<cmd>noh<CR>')
else
   --vscode specific
   lol.xd = 0
   Keymap('x', '<leader>gc', '<Plug>VsCodeCommentary')
   Keymap('n', '<leader>gc', '<Plug>VsCodeCommentary')
   Keymap('o', '<leader>gc', '<Plug>VsCodeCommentary')
   Keymap('n', 'gcc', '<Plug>VsCodeCommentary')
end

