return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        automatic_enable = false, -- Enabled via nvim-lspconfig
        ensure_installed = {
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            -- "rust_analyzer", Requires manual installation due to issues with rust-analyzer in combination with mason-lspconfig
            "taplo",
            "yamlls",
        },
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
