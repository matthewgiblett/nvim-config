return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	keys = {
		{ "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git add" },
		{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
		{ "<leader>gg", vim.cmd.Git, desc = "Git open menu" },
		{ "<leader>gp", "<cmd>Git pull<cr>", desc = "Git pull" },
	},
}
