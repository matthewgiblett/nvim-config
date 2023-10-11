return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			filetypes_denylist = { "md" },
		})

		vim.keymap.set("n", "<leader>ti", "<cmd>IlluminateToggle<CR>", { desc = "[T]oggle [I]lluminate" })
		vim.keymap.set("n", "<leader>tf", require("illuminate").toggle_freeze_buf, { desc = "[F]reeze Illuminate" })
	end,
}
