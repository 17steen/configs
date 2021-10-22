local lspconfig = require'lspconfig'
local completion = require'cmp_nvim_lsp'
--local lspinstall = require'lspinstall'
--

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = completion.update_capabilities(capabilities)

local servers = { "clangd", "tsserver", "vimls", "jsonls", "bashls", "html",
    "elmls", "cssls", "cmake", "hls", "sqlls", "jedi_language_server",
    "texlab", "ocamllsp", "gopls", "dartls",
}

vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = completion.update_capabilities(capabilities)

for _,lsp in ipairs(servers) do
    lspconfig[lsp].setup{
        capabilities = capabilities
    }
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

require'lspconfig'.fsautocomplete.setup{
    capabilities = capabilities,
    cmd = { "dotnet", "fsautocomplete", "--background-service-enabled" },
    filetypes = { "fsharp" },
   init_options = {
      AutomaticWorkspaceInit = true
    },
    --root_dir = function(startpath)
    --    return M.search_ancestors(startpath, matcher)
    --end
}

lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
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
    capabilities = capabilities,
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) }
}

local USER = vim.fn.expand("$USER")

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
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

