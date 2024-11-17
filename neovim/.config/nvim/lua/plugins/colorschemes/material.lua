return {
	"marko-cerovac/material.nvim",
	name = "  Material", -- e673
	enabled = true,
	config = function()
		local colors = require("material.colors")
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
			custom_highlights = {
				AlphaButton = { fg = colors.main.green },
				AlphaFile = { fg = colors.main.red },
				AlphaFooter = { fg = colors.main.cyan },
				AlphaHeader = { fg = colors.main.cyan, bold = true },
				AlphaHeading = { fg = colors.main.cyan, bold = true },
				AlphaHeaderLabel = { fg = colors.editor.fg, italic = true },
				AlphaShortcut = { fg = colors.main.purple, bold = true },
			},
		})
		-- variants: darker, lighter, oceanic, palenight, deep ocean
		vim.g.material_style = "deep ocean"
		vim.cmd([[colorscheme material]])
	end,
}
