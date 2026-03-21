return {
    'stevearc/conform.nvim',
    opts = {
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            css = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            python = {
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports",
                lsp_format = "never",
            },
            rust = { "rustfmt" },
            sh = { "shfmt" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    }
}
