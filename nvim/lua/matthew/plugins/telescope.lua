return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files" },
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			desc = "List open buffers",
		},
		{
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			desc = "Find string under cursor",
		},
		{
			"<leader>fh",
			"<cmd>Telescope help_tags<cr>",
			desc = "List available help tags",
		},
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Fuzzy find recent files",
		},
		{
			"<leader>fs",
			"<cmd>Telescope live_grep<cr>",
			desc = "Find string",
		},
		{
			"<leader>glb",
			"<cmd>Telescope git_branches<cr>",
			desc = "List git branches",
		},

		{
			"<leader>glc",
			"<cmd>Telescope git_commits<cr>",
			desc = "List git commits (<cr> to checkout)",
		},
		{
			"<leader>gld",
			"<cmd>Telescope git_status<cr>",
			desc = "List file differences",
		},
		{
			"<leader>glf",
			"<cmd>Telescope git_bcommits<cr>",
			desc = "List git file/buffer commits",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
