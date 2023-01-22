-- set leader
vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>wsv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>wsh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>wse", "<C-w>=") -- make splits equal
keymap.set("n", "<leader>wc", ":close<CR>") -- close current window
keymap.set("n", "<leader>wh", "<C-w>h") -- move to left window
keymap.set("n", "<leader>wj", "<C-w>j") -- move to window below
keymap.set("n", "<leader>wk", "<C-w>k") -- move to window above
keymap.set("n", "<leader>wl", "<C-w>l") -- move to right window
keymap.set("n", "<C-Up>", ":resize +2<CR>") -- increase height
keymap.set("n", "<C-Down>", ":resize -2<CR>") -- decrease height
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>") -- decrease width
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>") -- increase width

-- buffer management
keymap.set("n", "<leader>bc", ":bd<CR>") -- close current buffer

-- misc

-- move visually selected blocks up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within cwd
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in cwd
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- markdown preview
keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>") -- toggle markdown preview

-- checkbox toggle
keymap.set("n", "<leader>tc", "<cmd>lua require('checkbox-toggle').toggle()<cr>")
