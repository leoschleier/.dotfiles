local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Minimum number of lines to the end of view
opt.scrolloff = 8

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider hypenated expressions as one word
opt.iskeyword:append("-")

-- Time that Vim waits after typing before triggering a plugin
opt.updatetime = 50 -- ms (Default: 4000 ms)


