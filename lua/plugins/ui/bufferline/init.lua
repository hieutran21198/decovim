require("bufferline").setup({
	options = {
		mode = "buffers",
		themeable = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		-- separator_style = "slant" | "slope" | "thick" | "thin" | { "any", "any" },
		separator_style = "slope",
		always_show_bufferline = true,
	},
})
