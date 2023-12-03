return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				autotag = { enable = true },
				ensure_installed = {
					"json",
					"yaml",
					"markdown",
					"markdown_inline",
					"lua",
					"gitignore",
					"c",
					"python",
					"rust",
				},
				auto_install = true,
				sync_install = false,
				additional_vim_regex_highlighting = false,
			})
		end,
	},
}
