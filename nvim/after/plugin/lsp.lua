local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float(0, {scope="line"}) end, opts)
end)


require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {"jsonls", "lua_ls", "marksman", "pyright", "rust_analyzer", "taplo", "yamlls"},
    handlers = {
        lsp.default_setup,
    },
})


local rust_tools = require('rust-tools')
rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
        end
    }
})
