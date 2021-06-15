
local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end


function _G.tab_forwards()
	return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.tab_backwards()
	return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end


Keymap_expr('i', '<Tab>', 'v:lua.tab_forwards()')
Keymap_expr('i', '<S-Tab>', 'v:lua.tab_backwards()')


--go to defintition
Keymap_silent('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
--go to declaration
Keymap_silent('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>')
--go to implementiation
Keymap_silent('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
--go to type
Keymap_silent('n', '<leader>gt', ':lua vim.lsp.buf.type_definition()<CR>')
--go to references
Keymap_silent('n', '<leader>grr', ':lua vim.lsp.buf.references()<CR>')
Keymap_silent('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
Keymap_silent('n', '<leader>gh', ':lua vim.lsp.buf.hover()<CR>')
Keymap_silent('n', '<leader>ge', ':lua vim.lsp.buf.signature_help()<CR>')

Keymap_silent('n', '<leader>', ':ClangdSwitchSourceHeader<CR>')

--show diagnostics line
Keymap_silent('n', '<leader>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

--format
Keymap_silent('n', '<leader>s', ':w<CR><cmd>lua vim.lsp.buf.formatting()<CR>')

--switch between headers c++
Keymap_silent('n', '<leader>c', ':ClangdSwitchSourceHeader<CR>')

--code action
Keymap_silent('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>')





