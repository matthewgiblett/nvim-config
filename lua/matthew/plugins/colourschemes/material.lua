return {
	"marko-cerovac/material.nvim",
	name = "  Material",
	enabled = true,
	config = function()
		require("material").setup({
			plugins = {
				"dap",
				-- "dashboard",
				-- "flash"
				"gitsigns",
				-- "hop",
				-- "indent-blankline",
				"lspsaga",
				-- "mini",
				-- "neogit",
				-- "neorg",
				"nvim-cmp",
				-- "nvim-navic",
				"nvim-tree",
				"nvim-web-devicons",
				-- "sneak",
				"telescope",
				"trouble",
				"which-key",
			},
			disable = {
				colored_cursor = true,
				background = true,
			},
			lualine_style = "stealth",
		})
		-- variants: darker, lighter, oceanic, palenight, deep ocean
		vim.g.material_style = "deep ocean"
		vim.cmd([[colorscheme material]])
	end,
	alpha = {
		primary = "Operator",
		secondary = "Operator",
		information = "String",
		heading = "Error",
		button = { text = "String", shortcut = "Keyword" },
	},
}
