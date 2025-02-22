vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight cursor line
vim.opt.cursorline = true

-- Spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- No wrap
vim.opt.wrap = false

-- Allow use of mouse
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- case insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- how windows should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- preview substitutions
vim.opt.inccommand = "split"

-- lines to keep above and below cursor
vim.opt.scrolloff = 8

-- disable the mode since its in the status line
vim.opt.showmode = false

-- Change update time, useful for things like highlighting the current word when pausing on it
vim.opt.updatetime = 250

-- have a sign column to the right of the line numbers
vim.opt.signcolumn = "yes"

-- set border around diagnostic floating window
vim.diagnostic.config({
	float = { border = "single" },
})
