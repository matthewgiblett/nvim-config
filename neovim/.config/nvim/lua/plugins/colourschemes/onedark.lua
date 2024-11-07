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
			highlights = {
				["AlphaButton"] = { fg = "$cyan" },
				["AlphaFile"] = { fg = "$green" },
				["AlphaFooter"] = { fg = "$blue" },
				["AlphaHeader"] = { fg = "$blue", fmt = "bold" },
				["AlphaHeading"] = { fg = "$blue", fmt = "bold" },
				["AlphaHeaderLabel"] = { fg = "$fg", fmt = "italic" },
				["AlphaShortcut"] = { fg = "$cyan", fmt = "bold" },
			},
		})
		vim.cmd([[colorscheme onedark]])
	end,
}
