local actions = require("actions")

local normal = {
	q = { actions.close_on_terminal, "󰅳 Toggle Terminal" },
	["<leader>u"] = {
		name = "󰏡 Utils",
		v = { actions.toggle_virtual_text, "󰅳 Virtual Text" },
		l = { actions.toggle_breadcums, " Breadcums" },
		i = { actions.pick_yank_icon, " Yank icon" },
		m = { actions.preview_markdown, " Markdown Preview" },
		u = { actions.undo_histories, " Undo Histories" },
		r = { actions.resume_telescope, " Resume recent searched results" },
		t = { actions.list_todos, " Todo" },
		["="] = { actions.tabular("="), "Tabulize =" },
		[":"] = { actions.tabular(":"), "Tabulize :" },
	},
	["<leader>"] = {
		["1"] = { actions.focus_toggle_explorer(true), " Explorer" },
		["2"] = { actions.toggle_terminal, " Terminal" },
		["7"] = { actions.lsp_outline(false), " Symbols outline" },
	},
	["<leader>e"] = { actions.focus_toggle_explorer(true), " NeoTree" },
	["<leader>f"] = {
		name = "󰈞 Finding",
		f = { actions.finding_or_resume({ type = "file" }), "󰈞 Find file" },
		F = {
			actions.finding_or_resume({
				type = "file",
				args = "follow=true no_ignore=true hidden=true",
			}),
			" Find files (hidden)",
		},
		g = { "<cmd>Telescope git_status<cr>", "󰊢 Git status" },
		s = { actions.finding_or_resume({ type = "text" }), " Search text" },
	},

	["<leader>w"] = {
		name = " Windows",
		l = { actions.select_window("l"), "→ Select Window At The Right" },
		h = { actions.select_window("h"), "← Select Window At The Left" },
		j = { actions.select_window("j"), "↓ Select Window At The Bottom" },
		k = { actions.select_window("k"), "↑ Select Window At The Top" },
		o = { actions.finding_or_resume({ type = "buffer" }), " Opened Buffers" },
	},
	["<leader>g"] = {
		name = " Git",
		C = { actions.finding_or_resume({ type = "commit" }), "󰜘 Commits" },
		c = { actions.finding_or_resume({ type = "bcommit" }), "󰜘 Commits for current buffer" },
		s = { actions.git_stash_list, "󱡠 Stash list" },
	},
	["<leader>b"] = {
		name = " Buffer",
		c = { vim.cmd.ColorizerToggle, " Toggle colors" },
		n = { vim.cmd([[enew]]), " New buffer" },
		q = {
			function()
				require("bufdelete").bufdelete(0, true)
			end,
			" Close buffer",
		},
		o = { actions.finding_or_resume({ type = "buffer" }), " Opened Buffers" },
		y = {
			actions.yank_content_of_file,
			" Yank content of files",
		},
	},
	["["] = {
		name = "◀ Moving backward",
		t = {
			function()
				require("todo-comments").jump_prev()
			end,
			" Previous todo comment",
		},
		x = {
			function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end,
			"󰅁 Previous Trouble",
		},
		g = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", " Previous hunk" },
	},
	["]"] = {
		name = "▶ Moving forward",
		t = {
			function()
				require("todo-comments").jump_next()
			end,
			" Next todo comment",
		},
		x = {
			function()
				require("trouble").next({ skip_groups = true, jump = true })
			end,
			"󰅁 Next Trouble",
		},
		g = { "<cmd>lua require('gitsigns').next_hunk()<cr>", " Next hunk" },
	},
	d = { '"_d', "Delete without saving content to register" },
	s = { actions.quick_jump, " Quick jump" },
	["<esc>"] = { actions.escape, "Map ESC" },
	-- ["<leader>l"] = {
	-- 	name = " LSP",
	-- 	R = { "<cmd>Trouble lsp_references<cr>", " LSP References" },
	-- },
	-- ["<leader>x"] = {
	-- 	name = "󰅁 Trouble",
	-- 	t = { "<cmd>TroubleToggle<cr>", " Toggle" },
	-- 	r = { "<cmd>TroubleRefresh<cr>", " Refresh" },
	-- 	d = { "<cmd>TroubleToggle document_diagnostics<cr>", " Document diagnostics" },
	-- 	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", " Workspace diagnostics" },
	-- },

	-- ["<leader>d"] = {
	-- 	name = " Debug",
	-- 	c = { "<cmd>lua require('dap').continue()<cr>", " Continue" },
	-- 	i = { "<cmd>lua require('dap').step_into()<cr>", " Step into" },
	-- 	o = { "<cmd>lua require('dap').step_over()<cr>", " Step over" },
	-- 	O = { "<cmd>lua require('dap').step_out()<cr>", " Step out" },
	-- 	b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", " Toggle breakpoint" },
	-- },
	-- ["<leader>D"] = { "<cmd>lua require('dapui').toggle()<cr>", " Dap" },
}

local visual = {
	d = { '"_d', "Delete without saving content to register" },
	f = { '"zy:Telescope live_grep default_text=<C-r>z<cr>', "󰈞 Find current text." },
	["<leader>l"] = {
		name = " LSP",
		a = { ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", " Code action" },
	},
}

local terminal = {
	["<ESC>"] = { "<c-\\><c-n>", "󰗼 Back to normal mode" },
}

local M = {
	{
		mappings = normal,
		opts = {
			mode = "n",
			nowait = true,
			silent = true,
			noremap = true,
		},
	},
	{
		mappings = visual,
		opts = {
			mode = "v",
			nowait = true,
			silent = true,
			noremap = true,
		},
	},
	{
		mappings = terminal,
		opts = {
			mode = "t",
			nowait = true,
			silent = true,
			noremap = true,
		},
	},
}

return M
