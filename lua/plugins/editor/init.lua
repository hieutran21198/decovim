local M = {
	{ "gpanders/editorconfig.nvim" },
	{ "mbbill/undotree" },
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("plugins.editor.cursorline")
		end,
	},
	{
		"haringsrob/nvim_context_vt",
		config = function()
			require("plugins.editor.context-vt")
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("plugins.editor.comments")
		end,
	},
	{
		"ray-x/sad.nvim",
		dependencies = {
			{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		},
		config = function()
			require("plugins.editor.sad")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("plugins.editor.trouble")
		end,
	},
	{
		"godlygeek/tabular",
		config = function()
			require("plugins.editor.tabular")
		end,
	},
}

return M
