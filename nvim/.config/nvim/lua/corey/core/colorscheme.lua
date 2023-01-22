local nightfox_status, nightfox = pcall(require, "nightfox")
if not nightfox_status then
	return
end

nightfox.setup({
	options = {
		transparent = true,
	},
})

local status, _ = pcall(vim.cmd, "colorscheme nordfox")
if not status then
	return
end
