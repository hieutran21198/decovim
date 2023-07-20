local M = function(opt)
	local servers_configs = {
		marksman = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		tsserver = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		jsonls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		yamlls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		gopls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		docker_compose_language_service = {},
		dockerls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		lua_ls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		},
		sqlls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		golangci_lint_ls = {
			filetypes = { "go", "gomod" },
		},
		bashls = {
			on_attach = opt.on_attach,
			flags = opt.lsp_flags,
			capabilities = opt.capabilities,
		},
		eslint = {
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			--       buffer = bufnr,
			--       command = "EslintFixAll",
			--     })
		},
	}

	local schemastore_ok, schemastore = pcall(require, "schemastore")
	if schemastore_ok then
		servers_configs["jsonls"] = vim.tbl_deep_extend("force", servers_configs["jsonls"], {
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
				},
			},
		})

		servers_configs["yamlls"] = vim.tbl_deep_extend("force", servers_configs["yamlls"], {
			settings = {
				schemas = schemastore.yaml.schemas({
					extra = {
						description = "serverless",
						fileMatch = "serverless.*.yml,serverless.yml,serverless.yaml",
						name = "serverless.yaml",
						url = "https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json",
					},
				}),
			},
		})
	end

	return servers_configs
end

return M
