return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
        require("no-neck-pain").setup({
            -- The width of the focused window that will be centered. When the terminal width is less than the `width` option, the side buffers won't be created.
            ---@type integer|"textwidth"|"colorcolumn"
            width = 120,
            -- Creates mappings for you to easily interact with the exposed commands.
            ---@type table
            buffers = {
                wo = {
                    fillchars = "eob: ",
                },
            },
            mappings = {
                -- When `true`, creates all the mappings that are not set to `false`.
                ---@type boolean
                enabled = true,
                -- Sets a global mapping to Neovim, which allows you to toggle the plugin.
                -- When `false`, the mapping is not created.
                ---@type string
                toggle = "<Leader>np",
                -- Sets a global mapping to Neovim, which allows you to toggle the left side buffer.
                -- When `false`, the mapping is not created.
                ---@type string
                toggleLeftSide = "<Leader>nql",
                -- Sets a global mapping to Neovim, which allows you to toggle the right side buffer.
                -- When `false`, the mapping is not created.
                ---@type string
                toggleRightSide = "<Leader>nqr",
                -- Sets a global mapping to Neovim, which allows you to increase the width (+5) of the main window.
                -- When `false`, the mapping is not created.
                ---@type string | { mapping: string, value: number }
                widthUp = "<Leader>n=",
                -- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
                -- When `false`, the mapping is not created.
                ---@type string | { mapping: string, value: number }
                widthDown = "<Leader>n-",
                -- Sets a global mapping to Neovim, which allows you to toggle the scratchPad feature.
                -- When `false`, the mapping is not created.
                ---@type string
                scratchPad = "false",
            },
        })
    end
}

