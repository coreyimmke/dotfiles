return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"html",
				"htmldjango",
				"bash",
				"css",
				"csv",
				"dockerfile",
				"elixir",
				"json",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"sql",
				"terraform",
				"toml",
				"tsx",
				"typescript",
				"vala",
				"yaml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
