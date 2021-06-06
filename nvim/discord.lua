
function editing_text_handler (file)
    return "Editing " .. file
end

function workspace_text_handler (workspace)
    return "Working on " .. workspace
end


Presence = require("presence"):setup({
    -- This config table shows all available config options with their default values
    auto_update       = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua Presence:update()`)
    editing_text      = editing_text_handler,
    workspace_text    = workspace_text_handler,
    neovim_image_text = "Editing text", -- Text displayed when hovered over the Neovim image
    main_image        = "/home/steen/.config/nvim/neovim.png",                   -- Main image display (either "neovim" or "file")
--  client_id         = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level         = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout  = 15,                         -- Number of seconds to debounce TextChanged events (or calls to `:lua Presence:update(<buf>, true)`)
})
