return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		lualine.setup({
			options = {
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_c = {
					function()
						return require("auto-session.lib").current_session_name(true)
					end,
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#c4a7e7" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
