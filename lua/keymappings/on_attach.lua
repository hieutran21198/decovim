local actions = require("actions")

local lsp_keys = {
	name = " LSP",
	f = { actions.lsp("finder"), "󰈞 Finder" },
	i = { actions.lsp("implementation", true), "󰈞 Implementation" },
	d = { actions.lsp("definition"), "󰻫 Definition" },
	s = { actions.lsp("signature", true), "󰈞 Signature" },
	t = { actions.lsp("t_definition"), "󰈞 Type definition" },
	r = { actions.lsp("rename", true), "󰈞 Rename" },
	a = { actions.lsp("code_action", true), "󰈞 Code action" },
	l = { actions.lsp_attached_clients, "󰈞 Attached clients" },
	o = { actions.lsp("outline"), "󰈞 Symbols outline" },
	L = { actions.lsp_restart, "󰜉 Restart LSP" },

	D = { actions.lsp("diag", true), "󰈞 Document diagnostics" },
	W = { actions.lsp("w_diag", true), "󰈞 Workspace diagnostics" },
}

local M = {
	["*"] = {
		function(_, bufnr)
			return {
				{
					mappings = {
						["K"] = { actions.lsp("p_definition"), "󰻫 Peek definition" },
						["<leader>"] = { l = lsp_keys },
						["[e"] = { actions.lsp("diag_prev"), " Goto previous diagnostic" },
						["]e"] = { actions.lsp("diag_next"), " goto next diagnostic" },
					},
					opts = {
						mode = "n",
						buffer = bufnr,
						silent = true,
						noremap = true,
						nowait = false,
					},
				},
			}
		end,
	},
}

return M
