return {
	"marko-cerovac/material.nvim",
	name = "  Material",
	enabled = true,
	config = function()
		local colours = require("material.colors")
		require("material").setup({
			plugins = {
				"dap",
				"gitsigns",
				"harpoon",
				"illuminate",
				"indent-blankline",
				"lspsaga",
				"nvim-cmp",
				"nvim-tree",
				"nvim-web-devicons",
				"telescope",
				"trouble",
				"which-key",
			},
			disable = {
				colored_cursor = true,
				background = true,
			},
			lualine_style = "stealth",
			custom_highlights = {
				AlphaButton = { fg = colours.main.green },
				AlphaFile = { fg = colours.main.red },
				AlphaFooter = { fg = colours.main.cyan },
				AlphaHeader = { fg = colours.main.cyan, bold = true },
				AlphaHeading = { fg = colours.main.cyan, bold = true },
				AlphaHeaderLabel = { fg = colours.editor.fg, italic = true },
				AlphaShortcut = { fg = colours.main.purple, bold = true },
			},
		})
		-- variants: darker, lighter, oceanic, palenight, deep ocean
		vim.g.material_style = "deep ocean"
		vim.cmd([[colorscheme material]])
	end,
}
