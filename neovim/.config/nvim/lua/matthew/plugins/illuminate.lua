return {
	"RRethy/vim-illuminate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			filetypes_denylist = { "md" },
		})

		vim.keymap.set("n", "<leader>ti", "<cmd>IlluminateToggle<CR>", { desc = "Toggle illuminate" })
		vim.keymap.set("n", "<leader>tf", require("illuminate").toggle_freeze_buf, { desc = "Freeze illuminate" })
	end,
}
