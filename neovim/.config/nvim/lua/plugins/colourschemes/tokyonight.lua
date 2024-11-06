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
	AlphaButtons = "Tag",
	AlphaHeader = "Operator",
	AlphaHeaderLabel = "Special",
	AlphaShortcut = "Error",
}
