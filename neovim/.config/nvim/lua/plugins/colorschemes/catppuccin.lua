return {
	"catppuccin/nvim",
	name = "󰄛  Catppuccin", -- f011b
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
			custom_highlights = function(colors)
				return {
					AlphaButton = { fg = colors.blue },
					AlphaFile = { fg = colors.green },
					AlphaFooter = { fg = colors.green, italic = false },
					AlphaHeader = { fg = colors.green, bold = true },
					AlphaHeading = { fg = colors.green, bold = true },
					AlphaHeaderLabel = { fg = colors.overlay2, italic = true },
					AlphaShortcut = { fg = colors.mauve, bold = true },
				}
			end,
		})

		vim.cmd([[colorscheme catppuccin]])
	end,
}
