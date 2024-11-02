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
	alpha = {
		primary = "String",
		secondary = "String",
		information = "Operator",
		heading = "Error",
		button = { text = "Tag", shortcut = "Keyword" },
	},
}
