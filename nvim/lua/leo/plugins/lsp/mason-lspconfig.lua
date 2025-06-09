return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        automatic_enable = {
            exclude = {
                "rust_analyzer",
            }
        },
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
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
