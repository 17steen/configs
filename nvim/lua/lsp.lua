local lspconfig = require'lspconfig'
local completion = require'completion'
local lspinstall = require'lspinstall'

local servers = { "clangd", "tsserver", "vimls", "jsonls", "bashls", "html",
    "elmls", "cssls", "cmake", "hls", "sqlls", "jedi_language_server",
    "texlab", "ocamllsp", "gopls", "dartls",
}

vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

for _,lsp in ipairs(servers) do
    lspconfig[lsp].setup{ on_attach=completion.on_attach}
end


-- doing this makes lua go funky, so i just set her up manually
--[[
local function setup_servers()
    lspinstall.setup()
    local install_servers = lspinstall.installed_servers()
    for _,lsp in ipairs(install_servers) do
        lspconfig[lsp].setup{ on_attach=completion.on_attach}
    end
end

--setup_servers()

require'lspinstall'.post_install_hook = function ()
  --setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

--]]


lspconfig.rust_analyzer.setup{
    on_attach=completion.on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}



lspconfig.omnisharp.setup{
    on_attach=completion.on_attach,
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) }
}

local USER = vim.fn.expand("$USER")

lspconfig.sumneko_lua.setup {
    on_attach=completion.on_attach,
    cmd = { "/home/"..USER.."/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }

}

--[[
lspconfig.efm.setup {
    init_options = { documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}
--]]
