return {
	"EdenEast/nightfox.nvim",
	name = "  Nightfox",
	enabled = true,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})
		-- variants: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
		vim.cmd([[colorscheme carbonfox]])
	end,
	alpha = {
		primary = "Function",
		secondary = "String",
		information = "Boolean",
		heading = "String",
		button = { text = "Constant", shortcut = "Function" },
	},
}
