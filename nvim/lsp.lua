local lspconfig = require'lspconfig'
local completion = require'completion'

local servers = { "clangd", "tsserver", "vimls", "jsonls", "bashls", "html",
    "elmls", "cssls", "cmake", "hls", "sqlls", "jedi_language_server",
    "texlab", "ocamllsp", "gopls",
}

for _,lsp in ipairs(servers) do
    lspconfig[lsp].setup{ on_attach=completion.on_attach}
end

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

local sumneko_root_path = "/home/" .. "steen" .. "/.config/nvim/lua-language-server"

local sumneko_bin = sumneko_root_path .. "/bin/Linux/lua-language-server"

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
