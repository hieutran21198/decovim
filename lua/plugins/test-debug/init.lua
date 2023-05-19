local M = {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui" },
		},
		config = function()
			require("plugins.test-debug.dap")
		end,
	},
}

return M
