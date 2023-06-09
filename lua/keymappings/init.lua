local normal = {
	q = {
		function()
			local buf = vim.api.nvim_get_current_buf()
			local ft = vim.api.nvim_buf_get_option(buf, "filetype")
			if ft == "toggleterm" then
				vim.cmd.ToggleTermToggleAll()
			end
		end,
		" Quit",
	},
	["<leader>u"] = {
		name = " Utils",
		v = {
			function()
				vim.cmd("NvimContextVtToggle")
			end,
			" Virtual text",
		},
		t = { vim.cmd.Telescope, " Telescope" },
		c = { "<cmd>Telescope colorscheme<cr>", " Colorschemes" },
		l = {
			function()
				require("barbecue.ui").toggle()
			end,
			"  LSP context",
		},
		i = { "<cmd>IconPickerYank<cr>", " Yank icon" },
		m = { "<cmd>Glow<cr>", " Markdown preview" },
		u = { "<cmd>UndotreeToggle<cr>", " Undotree" },
	},
	["<leader>"] = {
		["1"] = { vim.cmd.NeoTreeFocusToggle, " NeoTree" },
		["2"] = {
			function()
				local bufs = vim.api.nvim_list_bufs()
				local found_toggle_term_instance = false

				for _, buf in ipairs(bufs) do
					local ft = vim.api.nvim_buf_get_option(buf, "filetype")
					if ft == "toggleterm" then
						found_toggle_term_instance = true
						-- vim.cmd.ToggleTermToggleAll()
					end
				end

				if not found_toggle_term_instance then
					vim.cmd.ToggleTerm()
				else
					vim.cmd.ToggleTermToggleAll()
				end
			end,
			" Terminal",
		},
		["6"] = { "<cmd>TroubleToggle document_diagnostics<cr>", " Document diagnostics" },
		["7"] = { "<cmd>Lspsaga outline<cr>", " Symbols outline" },
	},
	["<leader>t"] = {
		-- tabular
		name = "匿 Tabular",
		["="] = { "<cmd>Tab /=<cr>", "=" },
		[":"] = { "<cmd>Tab /:\zs<cr>", ":" },
		["1"] = {},
	},
	["<leader>d"] = {
		name = " Debug",
		c = { "<cmd>lua require('dap').continue()<cr>", " Continue" },
		i = { "<cmd>lua require('dap').step_into()<cr>", " Step into" },
		o = { "<cmd>lua require('dap').step_over()<cr>", " Step over" },
		O = { "<cmd>lua require('dap').step_out()<cr>", " Step out" },
		b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", " Toggle breakpoint" },
	},
	["<leader>D"] = { "<cmd>lua require('dapui').toggle()<cr>", " Dap" },
	["<leader>e"] = { vim.cmd.NeoTreeFocusToggle, " NeoTree" },
	["<leader>f"] = {
		name = " Finding",
		t = { vim.cmd.TodoTrouble, " Todo" },
		r = { "<cmd>Telescope resume<CR>", " Resume recent searched results" },
		f = { "<cmd>Telescope find_files<CR>", " Find file" },
		F = {
			"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
			" Find files (hidden)",
		},
		g = {
			"<cmd>Telescope git_status<cr>",
			" Git status",
		},
		s = { "<cmd>Telescope live_grep<CR>", " Search text" },
	},
	["<leader>l"] = {
		name = " LSP",
		R = { "<cmd>Trouble lsp_references<cr>", " LSP References" },
	},
	["<leader>x"] = {
		name = " Trouble",
		t = { "<cmd>TroubleToggle<cr>", " Toggle" },
		r = { "<cmd>TroubleRefresh<cr>", " Refresh" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", " Document diagnostics" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", " Workspace diagnostics" },
	},
	["<leader>w"] = {
		name = " Windows",
		l = { "<C-w>l<CR>", "→ Move cursor to the right" },
		h = { "<C-w>h<CR>", "← Move cursor to the left" },
		j = { "<C-w>j<CR>", "↓ Move cursor to the bottom" },
		k = { "<C-w>k<CR>", "↑ Move cursor to the top" },
		o = { "<cmd>Telescope buffers<cr>", "﬘ Opened Buffers" },
	},
	["<leader>g"] = {
		name = " Git",
		C = { "<cmd>Telescope git_commits<cr>", "ﰖ Commits" },
		c = { "<cmd>Telescope git_bcommits<cr>", "ﰖ Commits for current buffer" },
		s = { "<cmd>Telescope git_stash<cr>", " Stash list" },
	},
	["<leader>b"] = {
		name = "﬘ Buffer",
		c = { vim.cmd.ColorizerToggle, " Toggle colors" },
		q = {
			function()
				require("bufdelete").bufdelete(0, true)
			end,
			" Close buffer",
		},
		o = { "<cmd>Telescope buffers<cr>", "﬘ Opened Buffers" },
		y = {
			function()
				local file_path = vim.fn.expand("%:p")

				local content = vim.fn.readfile(file_path)
				vim.fn.setreg("+", content)
			end,
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
			" Previous Trouble",
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
			" Next Trouble",
		},
		g = { "<cmd>lua require('gitsigns').next_hunk()<cr>", " Next hunk" },
	},
	d = { '"_d', "Delete without saving content to register" },
	s = {
		function()
			local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
				return vim.api.nvim_win_get_config(win).focusable
			end, vim.api.nvim_tabpage_list_wins(0))
			require("leap").leap({ target_windows = focusable_windows_on_tabpage })
		end,
		" Flash!",
	},
	["<esc>"] = {
		function()
			vim.cmd([[nohl]])
			local buf = vim.api.nvim_get_current_buf()
			local ft = vim.api.nvim_buf_get_option(buf, "filetype")

			if ft == "toggleterm" then
				vim.cmd.ToggleTermToggleAll()
			end
		end,
		"Map ESC",
	},
}

local visual = {
	d = { '"_d', "Delete without saving content to register" },
	f = { '"zy:Telescope live_grep default_text=<C-r>z<cr>', " Find current text." },
	["<leader>l"] = {
		name = " LSP",
		a = { ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", " Code action" },
	},
}

local terminal = {
	["<ESC>"] = { "<c-\\><c-n>", " Back to normal mode" },
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
