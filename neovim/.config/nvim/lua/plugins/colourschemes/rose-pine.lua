return {
	"rose-pine/neovim",
	name = "󰧱  Rosé Pine",
	enabled = true,
	config = function()
		require("rose-pine").setup({
			-- variants: main, moon, dawn
			variant = "main",
			disable_background = true,
		})

		vim.cmd([[colorscheme rose-pine]])
	end,
	AlphaButtons = "Tag",
	AlphaHeader = "String",
	AlphaHeaderLabel = "Operator",
	AlphaShortcut = "Keyword",
}
