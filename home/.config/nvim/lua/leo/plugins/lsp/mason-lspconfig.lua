return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        automatic_enable = false, -- Enabled via nvim-lspconfig
        ensure_installed = {
            "dockerls",
            "eslint",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "ruff",
            "rust_analyzer",
            "taplo",
            "ts_ls",
            "yamlls",
        },
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
