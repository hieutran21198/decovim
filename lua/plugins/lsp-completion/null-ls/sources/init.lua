local M = {}

M.bind_sources = function(builtins)
	local formatting = builtins.formatting
	local diagnostics = builtins.diagnostics
	local code_actions = builtins.code_actions
	-- local completion = builtins.completion

	return {
		formatting.eslint_d,
		formatting.fish_indent,
		formatting.goimports,
		formatting.stylua,
		formatting.markdownlint,

		diagnostics.editorconfig_checker,
		diagnostics.eslint_d,
		diagnostics.fish,
		diagnostics.golangci_lint,
		diagnostics.luacheck,
		diagnostics.markdownlint,
		diagnostics.shellcheck,

		code_actions.eslint_d,
		code_actions.gomodifytags,
	}
end

return M
