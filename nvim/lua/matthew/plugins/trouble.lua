return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>xd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			desc = "Toggle document diagnostics list",
		},
		{
			"<leader>xl",
			function()
				require("trouble").toggle("loclist")
			end,
			desc = "Toggle location list",
		},
		{
			"<leader>xq",
			function()
				require("trouble").toggle("quickfix")
			end,
			desc = "Toggle quickfix list",
		},
		{
			"<leader>xr",
			function()
				require("trouble").toggle("lsp_references")
			end,
			desc = "Toggle lsp reference list",
		},
		{
			"<leader>xw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			desc = "Toggle workspace diagnostics list",
		},
		{
			"<leader>xx",
			function()
				require("trouble").toggle()
			end,
			desc = "Toggle trouble",
		},
	},
	opts = {
		auto_preview = false,
		use_diagnostic_signs = true,
	},
}
