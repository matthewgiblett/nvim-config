return {
	"rebelot/kanagawa.nvim",
	name = "󰻈  Kanagawa", -- f0ec8
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
			overrides = function(colors)
				local theme = colors.theme
				return {
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },
					NormalDark = { fg = "none", bg = "none" },
					LazyNormal = { bg = "none", fg = "none" },
					MasonNormal = { bg = "none", fg = "none" },

					AlphaButton = { fg = colors.palette.lightBlue },
					AlphaFile = { fg = colors.palette.peachRed },
					AlphaFooter = { fg = colors.palette.lightBlue },
					AlphaHeader = { fg = colors.palette.lightBlue, bold = true },
					AlphaHeading = { fg = colors.palette.fujiWhite, bold = true },
					AlphaHeaderLabel = { fg = colors.palette.fujiWhite, italic = true },
					AlphaShortcut = { fg = colors.palette.springGreen, bold = true },

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
