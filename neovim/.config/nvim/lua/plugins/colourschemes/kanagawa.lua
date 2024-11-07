return {
	"rebelot/kanagawa.nvim",
	name = "  Kanagawa",
	enabled = true,
	config = function()
		require("kanagawa").setup({
			-- variants: wave, dragon, lotus
			theme = "dragon",
			transparent = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_p1 = "none",
							bg_p2 = "none",
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function(colours)
				local theme = colours.theme
				return {
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },
					NormalDark = { fg = "none", bg = "none" },
					LazyNormal = { bg = "none", fg = "none" },
					MasonNormal = { bg = "none", fg = "none" },

					AlphaButton = { fg = colours.palette.lightBlue },
					AlphaFile = { fg = colours.palette.peachRed },
					AlphaFooter = { fg = colours.palette.lightBlue },
					AlphaHeader = { fg = colours.palette.lightBlue, bold = true },
					AlphaHeading = { fg = colours.palette.fujiWhite, bold = true },
					AlphaHeaderLabel = { fg = colours.palette.fujiWhite, italic = true },
					AlphaShortcut = { fg = colours.palette.springGreen, bold = true },

					TelescopeTitle = { fg = theme.syn.string, bold = true },
					TelescopeBorder = { fg = theme.ui.bg_dim, bg = "none" },
					TelescopeResultsBorder = { fg = theme.ui.bg_dim },
					TelescopePreviewBorder = { fg = theme.ui.bg_dim },
				}
			end,
		})
		vim.cmd([[colorscheme kanagawa]])
	end,
}
