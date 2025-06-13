return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        automatic_enable = false, -- Enabled via nvim-lspconfig
        ensure_installed = {
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "rust_analyzer",
            "taplo",
            "yamlls",
        },
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
