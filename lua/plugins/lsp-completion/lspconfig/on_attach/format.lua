local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return function(client, bufnr)
	-- format on save.
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(cli)
						return cli.name == "null-ls"
					end,
				})
			end,
		})
	end
end
