return {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				FIX = {
					icon = "", -- f00e4
					color = "error",
				},
				TODO = {
					icon = "", -- f276
					color = "info",
				},
				HACK = {
					icon = "󰶯", -- f0daf
					color = "warning",
				},
				WARN = {
					icon = "", -- f071
					color = "warning",
				},
				PERF = {
					icon = "󰈸", -- f0238
					color = "error",
				},
				NOTE = {
					icon = "", -- f249
					color = "hint",
				},
				TEST = {
					icon = "󰙨", -- f0668
					color = "test",
				},
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			local comment = require("Comment")
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			comment.setup({
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
}
