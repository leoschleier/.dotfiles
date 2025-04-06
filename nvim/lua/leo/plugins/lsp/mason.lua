return {
    "williamboman/mason.nvim",
    config = function()
        -- import mason
        local mason = require("mason")

        -- Enable and configure mason
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end,
}
