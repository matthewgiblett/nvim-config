return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		keys = {
			{ "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git add" },
			{ "<leader>gc", "<cmd>Git commit -S<cr>", desc = "Git commit -S" },
			{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
			{ "<leader>gg", vim.cmd.Git, desc = "Git open menu" },
			{ "<leader>go", "<cmd>Git push origin main<cr>", desc = "Git push origin main" },
			{ "<leader>gp", "<cmd>Git pull<cr>", desc = "Git pull" },
		},
	},
	{
		"rbong/vim-flog",
		event = "VeryLazy",
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
}
