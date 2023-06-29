local M = {}

M.bind_sources = function(builtins)
	local formatting = builtins.formatting
	local diagnostics = builtins.diagnostics
	local code_actions = builtins.code_actions
	-- local completion = builtins.completion

	return {
		-- formatting.eslint,
		formatting.fish_indent,
		formatting.goimports,
		formatting.goimports_reviser,

		formatting.stylua,
		formatting.markdownlint,
		formatting.prettierd,

		diagnostics.editorconfig_checker,
		-- diagnostics.eslint,
		diagnostics.fish,
		-- diagnostics.golangci_lint,
		diagnostics.write_good,

		diagnostics.luacheck,
		diagnostics.markdownlint,

		code_actions.shellcheck,
		code_actions.eslint,
		code_actions.gomodifytags,
	}
end

return M
