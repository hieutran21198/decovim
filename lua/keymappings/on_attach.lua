local M = {
	["*"] = {
		function(_, bufnr)
			return {
				{
					mappings = {
						["K"] = { "<cmd>Lspsaga peek_definition<cr>", " Peek definition" },
						["<leader>"] = {
							l = {
								name = " LSP",
								d = { "<cmd>Lspsaga lsp_finder<cr>", " Definition" },
								w = { "<cmd>TroubleToggle document_diagnostics<cr>", " Document diagnostics" },
								D = { vim.lsp.buf.declaration, " Declaration" },
								i = { vim.lsp.buf.implementation, " Implementation" },
								k = { "<cmd>Lspsaga peek_definition<cr>", " Peek definition" },
								s = { vim.lsp.buf.signature_help, " Signature" },
								t = { vim.lsp.buf.type_definition, " Type definition" },
								r = { vim.lsp.buf.rename, " Rename" },
								a = { vim.lsp.buf.code_action, " Code action" },
								R = { "<cmd>TroubleToggle lsp_references<cr>", " References" },
								l = { vim.cmd.LspInfo, " LSP Infomation" },
								o = { "<cmd>Lspsaga outline<cr>", " Symbols outline" },
								c = { "<cmd>Lspsaga incoming_calls<cr>", " Incoming calls" },
								C = { "<cmd>Lspsaga outgoing_calls<cr>", " Outgoing calls" },
								L = {
									vim.cmd.LspRestart,
									"ﰇ Restart LSP",
								},
								f = {
									function()
										vim.lsp.buf.format({ async = true })
									end,
									" Format",
								},
							},
						},
						["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", " Goto previous diagnostic" },
						["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", " goto next diagnostic" },
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
