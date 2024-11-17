return {
	"folke/tokyonight.nvim",
	name = "󰨷  Tokyo Night", -- f0a36
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
			on_highlights = function(highlights, colors)
				highlights.AlphaButton = { fg = colors.blue }
				highlights.AlphaFile = { fg = colors.cyan }
				highlights.AlphaFooter = { fg = colors.green, italic = false }
				highlights.AlphaHeader = { fg = colors.green, bold = true }
				highlights.AlphaHeading = { fg = colors.green, bold = true }
				highlights.AlphaHeaderLabel = { fg = colors.fg, italic = true }
				highlights.AlphaShortcut = { fg = colors.blue, bold = true }
			end,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
