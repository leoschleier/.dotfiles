return {
    "zbirenbaum/copilot.lua",
    --[[
    requires = {
        "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    ]]
    cmd = "Copilot",
    -- For auto-start: event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
    end,
}
