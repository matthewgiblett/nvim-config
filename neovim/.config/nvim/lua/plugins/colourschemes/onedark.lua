return {
	"navarasu/onedark.nvim",
	name = "󰛡  One Dark",
	enabled = true,
	config = function()
		require("onedark").setup({
			-- variants: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
			style = "deep",
			transparent = true,
			lualine = {
				transparent = true,
			},
		})
		vim.cmd([[colorscheme onedark]])
	end,
	AlphaButtons = "Constant",
	AlphaHeader = "Function",
	AlphaHeaderLabel = "Variable",
	AlphaShortcut = "Function",
}
