local M = {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text" },
			{ "LiadOz/nvim-dap-repl-highlights" },
			{ "leoluz/nvim-dap-go" },
		},
		config = function()
			require("plugins.test-debug.dap")
		end,
	},
}

return M
