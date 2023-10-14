return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<F10>", '<cmd>lua require"dap".step_over()<CR>', desc = "Debugging step over" },
		{ "<F11>", '<cmd>lua require"dap".step_into()<CR>', desc = "Debugging step into" },
		{ "<F12>", '<cmd>lua require"dap".step_out()<CR>', desc = "Debugging step out" },
		{ "<F5>", '<cmd>lua require"dap".continue()<CR>', desc = "Debugging continue" },
		{ "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', desc = "Debugging toggle Breakpoint" },
		{
			"<leader>dc",
			'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
			desc = "Debugging set breakpoint Condition",
		},
	},
}
