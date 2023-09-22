return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local blankline = require("indent_blankline")

		blankline.setup({
			char = "▏",
			show_end_of_line = true,
			show_trailing_blankline_indent = false,
			show_current_context = true,
		})
	end,
}
