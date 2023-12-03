return {
	"saecki/crates.nvim",
	tag = "stable",
	ft = { "toml" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local crates = require("crates")
		local cmp = require("cmp")
		crates.setup()
		cmp.setup.buffer({
			sources = { { name = "crates" } },
		})
		crates.show()
	end,
}
