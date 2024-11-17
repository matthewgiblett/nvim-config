return {
	"EdenEast/nightfox.nvim",
	name = "  Nightfox", -- f269
	enabled = true,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
			modules = {
				alpha = true,
				cmp = true,
				dap_ui = true,
				fidget = true,
				gitsigns = true,
				illuminate = true,
				indent_blankline = true,
				lazy = true,
				lsp_saga = true,
				lsp_trouble = true,
				nvimtree = true,
				treesitter = true,
				telescope = true,
				whichkey = true,
			},
			groups = {
				all = {
					AlphaButton = { fg = "palette.blue.dim" },
					AlphaFile = { fg = "palette.pink.bright" },
					AlphaFooter = { fg = "palette.blue" },
					AlphaHeader = { fg = "palette.blue.bright", style = "bold" },
					AlphaHeading = { fg = "palette.cyan.bright", style = "bold" },
					AlphaHeaderLabel = { fg = "palette.fg2", style = "italic" },
					AlphaShortcut = { fg = "palette.blue.bright", style = "bold" },
					NormalFloat = { bg = "none" },
				},
			},
		})
		-- variants: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
		vim.cmd([[colorscheme carbonfox]])
	end,
}
