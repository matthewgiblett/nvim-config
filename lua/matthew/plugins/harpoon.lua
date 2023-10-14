return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })
		keymap.set("n", "<leader>hm", mark.add_file, { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>hn", function()
			ui.nav_next()
		end, { desc = "Go to next harpoon mark" })
		keymap.set("n", "<leader>hp", function()
			ui.nav_prev()
		end, { desc = "Go to previous harpoon mark" })
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
	end,
}
