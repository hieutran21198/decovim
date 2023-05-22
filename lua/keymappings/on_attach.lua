local M = {
	["*"] = {
		function(_, bufnr)
			return {
				{
					mappings = {
						["<leader>"] = {
							l = {
								name = " LSP",
								d = { "<cmd>TroubleToggle lsp_definitions<cr>", " Definition" },
								D = { vim.lsp.buf.declaration, " Declaration" },
								i = { vim.lsp.buf.implementation, " Implementation" },
								k = { vim.lsp.buf.hover, " Hover" },
								s = { vim.lsp.buf.signature_help, " Signature" },
								w = { vim.lsp.buf.add_workspace_folder, " Add workspace folder" },
								W = { vim.lsp.buf.remove_workspace_folder, " Remove workspace folder" },
								t = { vim.lsp.buf.type_definition, " Type definition" },
								r = { vim.lsp.buf.rename, " Rename" },
								a = { vim.lsp.buf.code_action, " Action" },
								R = { "<cmd>TroubleToggle lsp_references<cr>", " References" },
								-- R = { vim.lsp.buf.references, " References" },
								l = { vim.cmd.LspInfo, " LSP Infomation" },
								o = { vim.cmd.SymbolsOutline, " Symbols outline" },
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
						["[e"] = { vim.diagnostic.goto_prev, " Goto previous diagnostic" },
						["]e"] = { vim.diagnostic.goto_next, " goto next diagnostic" },
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
