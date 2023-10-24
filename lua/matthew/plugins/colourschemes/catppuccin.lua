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
				illuminate = {
					enabled = true,
				},
				which_key = true,
			},
		})

		vim.cmd([[colorscheme catppuccin]])
	end,
	alpha = {
		primary = "String",
		secondary = "String",
		information = "Comment",
		heading = "String",
		button = { text = "Function", shortcut = "Conditional" },
	},
}
