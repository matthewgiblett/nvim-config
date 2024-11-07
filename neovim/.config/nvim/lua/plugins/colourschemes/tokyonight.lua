return {
	"folke/tokyonight.nvim",
	name = "󰨷  Tokyo Night",
	enabled = true,
	config = function()
		require("tokyonight").setup({
			-- variants: storm, night, moon, day
			style = "night",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			transparent = true,
			on_colors = function(colors)
				colors.bg_statusline = colors.none
			end,
			on_highlights = function(highlights, colours)
				highlights.AlphaButton = { fg = colours.blue }
				highlights.AlphaFile = { fg = colours.cyan }
				highlights.AlphaFooter = { fg = colours.green, italic = false }
				highlights.AlphaHeader = { fg = colours.green, bold = true }
				highlights.AlphaHeading = { fg = colours.green, bold = true }
				highlights.AlphaHeaderLabel = { fg = colours.fg, italic = true }
				highlights.AlphaShortcut = { fg = colours.blue, bold = true }
			end,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
