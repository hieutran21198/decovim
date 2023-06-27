local ok, noice = pcall(require, "noice")
if not ok then
	return
end

noice.setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		hover = { enabled = false },
		signature = { enabled = false },
	},
	cmdline = {
		enabled = true, -- enables the Noice cmdline UI
		view = "cmdline_popup",
		opts = {}, -- global options for the cmdline. See section on views
		format = {
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			filter = { pattern = "^:%s!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%slua%s+", "^:%slua%s=%s", "^:%s=%s" }, icon = "", lang = "lua" },
			help = { pattern = "^:%she?l?p?%s+", icon = "" },
			input = {}, -- Used by input()
			-- lua = false, -- to disable a format, set to `false`
		},
	},
})
