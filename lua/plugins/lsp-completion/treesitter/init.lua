require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "markdown", "markdown_inline" },
	sync_install = true,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = { "c", "rust" },
		additional_vim_regex_highlighting = false,
	},
})
