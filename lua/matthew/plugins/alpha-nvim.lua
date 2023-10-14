return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	config = function()
		local layout = require("matthew.core.alpha.layout")
		require("alpha").setup({ layout = layout })

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
