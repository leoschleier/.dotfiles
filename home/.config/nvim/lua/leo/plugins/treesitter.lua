return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        { "windwp/nvim-ts-autotag", opts = {} },
    },
    opts = {
        ensure_installed = {
            "c",
            "dockerfile",
            "gitignore",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "vim",
            "vimdoc",
            "query",
            "yaml",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
