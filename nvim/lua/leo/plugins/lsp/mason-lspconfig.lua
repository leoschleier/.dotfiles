return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "jsonls",
                "lua_ls",
                "marksman",
                "pyright",
                "rust_analyzer",
                "taplo",
                "yamlls",
            },
        })
    end,
}
