return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf) -- highlighting
                vim.bo[args.buf].indentexpr =
                    "v:lua.vim.treesitter.indentexpr()" -- indentation
            end,
        })
    end,
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
    end,
}
