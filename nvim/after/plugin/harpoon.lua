harpoon = require("harpoon")

harpoon:setup()
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>hö", function() harpoon:list():select(4) end)

