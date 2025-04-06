return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function ()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            -- Ensure these language parsers are installed
            ensure_installed = {
                "c", -- Mandatory
                "dockerfile",
                "gitignore",
                "json",
                "lua", -- Mandatory
                "markdown", -- Mandatory
                "markdown_inline", -- Mandatory
                "python",
                "rust",
                "vim", -- Mandatory
                "vimdoc", -- Mandatory
                "query",-- Mandatory
                "yaml",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            -- Enable autotagging (with nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
        })
    end
}
