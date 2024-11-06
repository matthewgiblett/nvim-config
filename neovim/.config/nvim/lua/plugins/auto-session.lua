return {
	"rmagatti/auto-session",
	event = "VeryLazy",
	keys = {
		{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" },
	},
	config = function()
		require("auto-session").setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Developer/", "~/Downloads", "~/Documents", "~/Desktop/" },
			bypass_save_filetypes = { "alpha" },
		})
	end,
}
