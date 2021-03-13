local lspconfig = require'lspconfig'
local completion = require'completion'

--lspconfig.clangd.setup{ on_attach=completion.on_attach }
--
--lspconfig.tsserver.setup{ on_attach=completion.on_attach }
--
--lspconfig.vimls.setup{ on_attach=completion.on_attach }
--
--lspconfig.jsonls.setup{ on_attach=completion.on_attach }
--
--lspconfig.bashls.setup{ on_attach=completion.on_attach }
--
--lspconfig.html.setup{ on_attach=completion.on_attach }
--
--lspconfig.elmls.setup{ on_attach=completion.on_attach }
--
--lspconfig.cssls.setup{ on_attach=completion.on_attach }
--
--lspconfig.cmake.setup{ on_attach=completion.on_attach }
--
--lspconfig.hls.setup{ on_attach=completion.on_attach }
--
--lspconfig.rust_analyzer.setup{ on_attach=completion.on_attach }
--
--lspconfig.sqlls.setup{ on_attach=completion.on_attach }
--
--lspconfig.jedi_language_server.setup{ on_attach=completion.on_attach }

local servers = { "clangd", "tsserver", "vimls", "jsonls", "bashls", "html", "elmls", "cssls", "cmake", "hls", "rust_analyzer", "sqlls", "jedi_language_server"}

for _,lsp in ipairs(servers) do
    lspconfig[lsp].setup{ on_attach=completion.on_attach}
end



local sumneko_root_path = "/home/" .. "steen" .. "/.config/nvim/lua-language-server"

local sumneko_bin = sumneko_root_path .. "/bin/Linux/lua-language-server"

lspconfig.omnisharp.setup{
    on_attach=completion.on_attach,
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) }
}

lspconfig.sumneko_lua.setup {
    on_attach=completion.on_attach,
    cmd = { sumneko_bin, "-E", sumneko_root_path .. "/main.lua"},
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
