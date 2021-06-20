local execute = vim.api.nvim_command
local fn = vim.fn

--make sure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git',  'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

vim.cmd 'packadd packer.nvim'

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
    --limits annoying warnings
    local use = use
    use 'gruvbox-community/gruvbox'

    use 'mbbill/undotree'
    use 'elmcast/elm-vim'

    use 'alaviss/nim.nvim'

    use 'habamax/vim-godot'

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'

    use 'kabouzeid/nvim-lspinstall'

    use 'nvim-treesitter/nvim-treesitter'

    use {'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end }
    use 'junegunn/fzf.vim'

    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

    use 'ayu-theme/ayu-vim'

    use 'luochen1990/rainbow'

    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    use 'andweeb/presence.nvim'

end)
