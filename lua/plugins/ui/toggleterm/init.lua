local toggleterm = require("toggleterm")

toggleterm.setup({
	size = 10,
	hide_numbers = true,
	autochdir = true,
	start_in_insert = false,
	insert_mappings = false,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = false,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	auto_scroll = true,
	winbar = {
		enabled = false,
		name_formatter = function(term)
			return term.name
		end,
	},
})
