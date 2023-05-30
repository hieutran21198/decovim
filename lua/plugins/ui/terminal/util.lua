local toggle = function(buf_no)
	if buf_no == nil then
		buf_no = 1
	end

	local term_bufs = {}
	local prefix = "term://"

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
		print(buf_name)
		if string.sub(buf_name, 1, #prefix) == prefix then
			table.insert(term_bufs, buf)
		end
	end

	if #term_bufs == 0 then
		vim.cmd([[ lua NTGlobal["terminal"]:open(buf_no) ]])
		return
	else
		vim.cmd([[ lua NTGlobal["terminal"]:toggle() ]])
	end
end

-- local on_esc = function()
-- 	local mode = vim.api.nvim_get_mode().mode
-- 	if mode == "t" then
-- 		vim.api.nvim_command("normal! <ESC>")
-- 	elseif mode == "n" then
-- 		vim.cmd([[ lua NTGlobal["terminal"]:close() ]])
-- 	end
-- end

local M = {
	toggle = toggle,
	on_esc = on_esc,
}

return M
