return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	build = ":TSInstall python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{
			"<leader>dpt",
			function()
				require("dap-python").test_method()
			end,
			desc = "Debug Python Method",
		},
		{
			"<leader>dpc",
			function()
				require("dap-python").test_class()
			end,
			desc = "Debug Python Class",
		},
	},
	config = function()
		local path = require("mason-registry").get_package("debugpy"):get_install_path()
		require("dap-python").setup(path .. "/venv/bin/python")
	end,
}
