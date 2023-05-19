require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim", "spectre_panel" },
	ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
	disable_in_macro = false,
	enable_afterquote = true,
	map_bs = true,
	map_c_w = false,
	disable_in_visualblock = false,
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
	check_ts = true,
	enable_check_bracket_line = false,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
	},
	map_char = {
		all = "(",
		tex = "{",
	},
})
