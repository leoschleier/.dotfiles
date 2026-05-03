return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter",
    config = function()
        local parsers = {
            "c",
            "c_sharp",
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
            "toml",
            "yaml",
        }
        require("nvim-treesitter").install(parsers)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf) -- highlighting
                vim.bo[args.buf].indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
            end,
        })
    end,
}
