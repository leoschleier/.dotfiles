return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",   -- source for file system paths
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets", -- useful snippets
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            auto_brackets = {}, -- configure any filetype to auto add brackets
            snippet = {         -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- sources for autocompletion
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- previous suggestion
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            }),
            sources = cmp.config.sources({
                { name = "copilot",    group_index = 2 },
                { name = "supermaven", group_index = 2 },
                { name = "nvim_lsp",   group_index = 2 },
                { name = "luasnip",    group_index = 2 }, -- snippets
                { name = "buffer",     group_index = 2 }, -- text within current buffer
                { name = "path",       group_index = 2 }, -- file system paths
            }),
        })
    end,
}
