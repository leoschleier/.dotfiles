vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "<C-c>", "<ESC>") -- Quit INSERT mode

keymap.set("n", "<leader>ex", vim.cmd.Ex)

keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear highlight

keymap.set("n", "x", '"_x') -- Delete single character without copying it into the register

keymap.set("n", "<leader>+", "<C-a>") -- Increment number
keymap.set("n", "<leader>-", "<C-x>") -- Decrement number

keymap.set("n", "<leader>sv", "<C-w>v") -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- Go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Primagean
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move line/block down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move line/block up

keymap.set("x", "<leader>p", "\"_dP") -- Paste without removing from register 

keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") -- Global replace for current string
