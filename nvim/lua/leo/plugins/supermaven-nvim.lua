return {
    "supermaven-inc/supermaven-nvim",
    cmd = { "SupermavenStart", "SupermavenToggle" },
    config = function()
        require("supermaven-nvim").setup({})
    end,
}
