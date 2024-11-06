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
	AlphaButtons = "Boolean",
	AlphaHeader = "Function",
	AlphaHeaderLabel = "Comment",
	AlphaShortcut = "Function",
}
