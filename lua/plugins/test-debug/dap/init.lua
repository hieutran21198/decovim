local dapui = require("dapui")
dapui.setup({
	expand_lines = true,
})

require("nvim-dap-virtual-text").setup()

require("nvim-dap-repl-highlights").setup()

require("dap.ext.vscode").load_launchjs(nil, {})

local dap = require("dap")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStop", { text = "", texthl = "", linehl = "", numhl = "" })

require("dap-go").setup()
