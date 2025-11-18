return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            styles = {
                transparency = true,
            },
            highlight_groups = {
                ColorColumn = { bg = "overlay" }, -- Same color as CursorLine
            },
        })
        vim.cmd("colorscheme rose-pine")
    end
}
