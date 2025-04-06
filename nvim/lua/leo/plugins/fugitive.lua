return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>fu", vim.cmd.Git)
    end
}
