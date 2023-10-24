return {
	"folke/tokyonight.nvim",
	name = "󰨷  Tokyo Night",
	enabled = true,
	config = function()
		require("tokyonight").setup({
			-- variants: storm, night, moon, day
			style = "night",
			transparent = true,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
	alpha = {
		primary = "Operator",
		secondary = "Keyword",
		information = "Special",
		heading = "String",
		button = { text = "Tag", shortcut = "Error" },
	},
}
