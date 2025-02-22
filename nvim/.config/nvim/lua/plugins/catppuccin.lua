return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		no_italic = true,
	},
	init = function()
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
