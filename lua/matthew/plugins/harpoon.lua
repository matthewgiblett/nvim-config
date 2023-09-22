return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap -- for conciseness
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
		keymap.set("n", "<leader>a", mark.add_file)
		keymap.set("n", "<C-e>", ui.toggle_quick_menu)
		keymap.set("n", "<C-s>", function()
			ui.nav_file(1)
		end)
		keymap.set("n", "<C-x>", function()
			ui.nav_file(2)
		end)
		keymap.set("n", "<C-n>", function()
			ui.nav_file(3)
		end)
		keymap.set("n", "<C-m>", function()
			ui.nav_file(4)
		end)
		keymap.set("n", "<leader>hn", function()
			ui.nav_next()
		end)
		keymap.set("n", "<leader>hp", function()
			ui.nav_prev()
		end)
	end,
}
