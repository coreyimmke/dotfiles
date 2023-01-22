local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local custom_nordfox = require("nightfox.util.lualine")("nordfox")
custom_nordfox.normal.c.bg = "#4C566A"
custom_nordfox.inactive.c.bg = "#4C566A"

lualine.setup({
	options = { theme = custom_nordfox },
})
