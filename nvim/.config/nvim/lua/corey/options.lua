local opt = vim.opt

-- line numbers
opt.relativenumber = true -- relative line numbers
opt.number = true -- current line shows actual num

-- indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- copy indent from current line to new ones
opt.breakindent = true -- line breaks to same indent level as prev line

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- if use mixed case then case sensitive search
opt.hlsearch = false -- do not highlight search
opt.incsearch = true

-- appearance
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column
opt.scrolloff = 4 -- keep 4 lines at bottom when scrolling
opt.pumheight = 10 -- pop up menu height

-- windows
opt.splitright = true -- split to right
opt.splitbelow = true -- split to bottom

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- entry
opt.backspace = "indent,eol,start" -- allow on indent, eol, or start pos
opt.clipboard = "unnamedplus" -- use system clipboard
opt.iskeyword:append("-") -- consider '-' as part of word
opt.fileencoding = "utf-8"
opt.mouse = "a" -- allow mouse to be used in all modes
opt.completeopt = 'menuone,noselect' -- completeopt to have a better completion experience

-- don't continue comments on next line
vim.api.nvim_create_augroup("group", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = "group",
})

-- other
opt.backup = false -- no backup file
opt.swapfile = false -- no swapfile
opt.modifiable = true
