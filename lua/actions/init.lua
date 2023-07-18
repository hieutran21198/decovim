local api = vim.api
local cmd = vim.cmd

local M = {
	finding_history = nil,
}

-- get current filetype under the cursor.
M.get_current_filetype = function(buf)
	local selected_buf = buf

	if buf == nil then
		selected_buf = api.nvim_get_current_buf()
	end

	return api.nvim_buf_get_option(selected_buf, "filetype")
end

M.toggle_terminal = function()
	local was_focused_terminal = M.close_on_terminal()

	if was_focused_terminal then
		return
	end

	local bufs = api.nvim_list_bufs()

	local found_instance = false
	for _, buf in ipairs(bufs) do
		local ft = M.get_current_filetype(buf)
		if ft == "toggleterm" then
			found_instance = true
		end
	end

	if not found_instance then
		cmd.ToggleTerm()
	else
		cmd.ToggleTermToggleAll()
	end
end

-- close terminal if current cursor is focus on terminal.
M.close_on_terminal = function()
	local ft = M.get_current_filetype()

	if ft == "toggleterm" then
		cmd.ToggleTermToggleAll()
		return true
	end

	return false
end

M.toggle_virtual_text = function()
	cmd.NvimContextVtToggle()
end

M.toggle_breadcums = function()
	local ok, b = pcall(require, "barbecue.ui")
	if not ok then
		return
	end

	b.toggle()
end

M.pick_yank_icon = function()
	cmd.IconPickerYank()
end

M.preview_markdown = function()
	cmd.Glow()
end

M.undo_histories = function()
	cmd.UndotreeToggle()
end

M.focus_toggle_explorer = function(focus)
	return function()
		if focus then
			local ft = M.get_current_filetype()

			local handler = ft == "neo-tree" and cmd.NeoTreeFocusToggle or cmd.NeoTreeFocus
			handler()

			return
		end

		cmd.NeoTreeFocusToggle()
	end
end

M.lsp_outline = function(native)
	return function()
		if native == nil or not native then
			cmd([[ Lspsaga outline ]])
		end
	end
end

M.lsp_attached_clients = function()
	cmd([[ LspInfo ]])
end

M.lsp_restart = function()
	cmd([[ LspRestart ]])
end

M.lsp_document_diagnostics = function()
	cmd([[ TroubleToggle document_diagnostics ]])
end

M.lsp_workspace_diagnosticss = function()
	cmd([[ TroubleToggle workspace_diagnostics ]])
end

M.lsp = function(action_name, native)
	local map_lsp_saga = {
		["finder"] = "lsp_finder",
		["outline"] = "outline",
		["rename"] = "rename",
		["code_action"] = "code_action",
		["definition"] = "goto_definition",
		["t_definition"] = "goto_type_definition",
		["p_definition"] = "peek_definition",

		["diag_next"] = "diagnostic_jump_next",
		["diag_prev"] = "diagnostic_jump_prev",
	}

	local lsp = vim.lsp

	local map_lsp_def = {
		["rename"] = lsp.buf.rename,
		["declaration"] = lsp.buf.declaration,
		["code_action"] = lsp.buf.code_action,
		["definition"] = lsp.buf.definition,
		["signature"] = lsp.buf.signature_help,
		["implementation"] = lsp.buf.implementation,
		["diag"] = M.lsp_document_diagnostics,
		["w_diag"] = M.lsp_workspace_diagnosticss,
	}

	return function()
		if native == nil or not native then
			local action = map_lsp_saga[action_name]
			if action ~= nil then
				cmd("Lspsaga " .. action)
			end
		else
			local action = map_lsp_def[action_name]
			if action ~= nil then
				action()
			end
		end
	end
end

M.tabular = function(char)
	return function()
		if char == ":" then
			cmd([[ Tab /:\zs ]])
		elseif char == "=" then
			cmd([[ Tab /= ]])
		end
	end
end

M.finding_or_resume = function(opts)
	local def = {
		type = "file",
	}

	def = vim.tbl_deep_extend("force", def, opts or {})

	local map_type_action = {
		["file"] = "find_files",
		["text"] = "live_grep",
		["buffer"] = "buffers",
	}

	return function()
		local action

		action = map_type_action[def.type]
		if action == nil or action == "" then
			action = "resume"
		end

		if M.finding_history ~= nil and M.finding_history == def.type then
			action = "resume"
		end

		if def.args ~= nil then
			action = action .. " " .. def.args
		end

		cmd("Telescope " .. action)
		M.finding_history = def.type
	end
end

M.resume_telescope = function()
	cmd([[ Telescope resume ]])
end

M.list_todos = function()
	cmd([[ TodoTrouble ]])
end

M.quick_jump = function()
	local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
		return api.nvim_win_get_config(win).focusable
	end, api.nvim_tabpage_list_wins(0))

	local ok, leap = pcall(require, "leap")
	if not ok then
		return
	end

	leap.leap({ target_windows = focusable_windows_on_tabpage })
end

M.escape = function()
	cmd([[nohl]])

	M.close_on_terminal()
end

M.select_window = function(pos)
	return function()
		if pos == "h" then
			cmd([[ wincmd h ]])
		elseif pos == "j" then
			cmd([[ wincmd j ]])
		elseif pos == "k" then
			cmd([[ wincmd k ]])
		elseif pos == "l" then
			cmd([[ wincmd l ]])
		end
	end
end

M.git_list_commits = function(for_current_buf)
	return function()
		if for_current_buf ~= nil and for_current_buf then
			cmd([[ Telescope git_bcommits ]])
		else
			cmd([[ Telescope git_commits ]])
		end
	end
end

M.git_stash_list = function()
	return cmd([[ Telescope git_stash ]])
end

M.yank_content_of_file = function()
	local file_path = vim.fn.expand("%:p")

	local content = vim.fn.readfile(file_path)
	vim.fn.setreg("+", content)
end

return M
