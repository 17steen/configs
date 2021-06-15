local configs = require'nvim-treesitter.configs'

--don't forget to run :TSInstall <language>


configs.setup{
    ensure_installed = 'maintained',
    highlight = {
        enable = true
    }
}
