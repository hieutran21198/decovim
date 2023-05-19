local null_ls = require("null-ls")

local sources = require("plugins.lsp-completion.null-ls.sources").bind_sources(null_ls.builtins)

null_ls.setup({
	sources = sources,
})
