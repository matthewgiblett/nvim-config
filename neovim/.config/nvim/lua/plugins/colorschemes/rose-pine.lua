return {
	"rose-pine/neovim",
	name = "󰧱  Rosé Pine", -- f09f1
	enabled = true,
	config = function()
		require("rose-pine").setup({
			-- variants: main, moon, dawn
			variant = "main",
			styles = {
				transparency = true,
			},
			highlight_groups = {
				AlphaButton = { fg = "rose" },
				AlphaFile = { fg = "love" },
				AlphaFooter = { fg = "foam", italic = false },
				AlphaHeader = { fg = "foam", bold = true },
				AlphaHeading = { fg = "foam", bold = true },
				AlphaHeaderLabel = { fg = "subtle", italic = true },
				AlphaShortcut = { fg = "gold", bold = true },
			},
		})

		vim.cmd([[colorscheme rose-pine]])
	end,
}
