return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "letieu/harpoon-lualine" },
	config = function()
		local lualine = require("lualine")
		local utils = require("lualine.utils")

		lualine.setup({
			options = {
				theme = utils.transparent_auto(),
				component_separators = {
					left = "",
					right = "",
				},
				section_separators = {
					left = "", -- e0c6
					right = "", -- e0c7
				},
				always_divide_middle = false,
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					"file",
					{
						"diagnostics",
						symbols = {
							error = " ", -- f057
							warn = " ", -- f071
							info = " ", -- f05a
							hint = " ", -- f0eb
						},
					},
				},
				lualine_c = {
					"format",
					"encodings",
					"treesitter",
					"venv",
					"git",
				},
				lualine_x = {
					"mason",
					"lazy",
				},
				lualine_y = {
					"lsp_server",
					"harpoon",
				},
				lualine_z = {
					"position",
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					"file",
				},
				lualine_x = {
					"harpoon",
					"position",
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
