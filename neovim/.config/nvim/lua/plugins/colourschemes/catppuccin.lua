return {
	"catppuccin/nvim",
	name = "󰄛  Catppuccin",
	enabled = true,
	config = function()
		require("catppuccin").setup({
			-- flavours: latte, frappe, macchiato, mocha
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				alpha = true,
				fidget = true,
				gitsigns = true,
				harpoon = true,
				indent_blankline = {
					enabled = true,
				},
				lsp_saga = true,
				mason = true,
				cmp = true,
				dap = {
					enabled = true,
					enable_ui = true,
				},
				nvimtree = true,
				treesitter = true,
				telescope = {
					enabled = true,
				},
				lsp_trouble = true,
				illuminate = {
					enabled = true,
				},
				which_key = true,
			},
			custom_highlights = function(colours)
				return {
					AlphaButton = { fg = colours.blue },
					AlphaFile = { fg = colours.green },
					AlphaFooter = { fg = colours.green, italic = false },
					AlphaHeader = { fg = colours.green, bold = true },
					AlphaHeading = { fg = colours.green, bold = true },
					AlphaHeaderLabel = { fg = colours.overlay2, italic = true },
					AlphaShortcut = { fg = colours.mauve, bold = true },
				}
			end,
		})

		vim.cmd([[colorscheme catppuccin]])
	end,
}
