local lspconfig = require("lspconfig")
local lspkind = require("lspkind")
local lspsaga = require("lspsaga")
local lspsignature = require("lsp_signature")

local mason = require("mason")
local masonlsp = require("mason-lspconfig")
local cmp = require("cmp")
local snippy = require("snippy")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

lspsaga.setup({
	finder = {
		keys = {
			expand_or_jump = "<cr>",
			vsplit = "<c-v>",
			split = "<c-x>",
			quit = { "q", "<ESC>" },
			close_in_preview = "<ESC>",
		},
	},
	definition = {
		vsplit = "<C-v>",
		split = "<C-x>",
		quit = "q",
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		preview_width = 0.4,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		auto_resize = false,
		custom_sort = nil,
		keys = {
			expand_or_jump = "<cr>",
			quit = "q",
		},
	},
})
mason.setup({})
snippy.setup({})
lspsignature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
})

local common_on_attach = function(client, bufnr)
	require("plugins.lsp-completion.lspconfig.on_attach.key_mappings")(client, bufnr)
	require("plugins.lsp-completion.lspconfig.on_attach.format")(client, bufnr)
end

local cmp_select_next_handler = function(fallback)
	if cmp.visible() then
		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
		if snippy.can_expand_or_advance() then
			snippy.expand_or_advance()
		else
			fallback()
		end
	end
end

local cmp_select_previous_handler = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
	else
		if snippy.can_jump(-1) then
			snippy.previous()
		else
			fallback()
		end
	end
end

local cmp_formats = function(entry, vim_item)
	local source_mapping = {
		buffer = "﬘",
		nvim_lsp = "",
		nvim_lua = "",
		path = "數",
	}

	local duplicates = {
		buffer = 1,
		path = 1,
		nvim_lsp = 0,
		luasnip = 1,
	}

	vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
	vim_item.menu = source_mapping[entry.source.name]
	vim_item.dup = duplicates[entry.source.name] or 0

	local max_width = 80
	if #vim_item.abbr > max_width then
		vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. ""
	end
	return vim_item
end

local cmp_window = require("cmp.config.window")

cmp.setup({
	snippet = {
		expand = function(args)
			snippy.expand_snippet(args.body)
		end,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		source_names = {
			nvim_lsp = "(LSP)",
			emoji = "(Emoji)",
			path = "(Path)",
			calc = "(Calc)",
			vsnip = "(Snippet)",
			luasnip = "(Snippet)",
			snippy = "(Snippet)",
			buffer = "(Buffer)",
			tmux = "(Tmux)",
			copilot = "(Copilot)",
			treesitter = "(TreeSitter)",
		},

		duplicates_default = 0,
		format = cmp_formats,
	},
	completion = {
		keyword_length = 1,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	window = {
		completion = cmp_window.bordered(),
		documentation = cmp_window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<PageUp>"] = cmp.mapping.scroll_docs(-4),
		["<PageDown>"] = cmp.mapping.scroll_docs(4),
		["<C-s>"] = cmp.mapping.complete({
			config = {
				sources = {},
			},
		}),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-j>"] = cmp.mapping(cmp_select_next_handler, { "i", "s" }),
		["<C-k>"] = cmp.mapping(cmp_select_previous_handler, { "i", "s" }),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Tab>"] = cmp.mapping(cmp_select_next_handler, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp_select_previous_handler, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			entry_filter = function(entry)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
				if kind == "Text" then
					return false
				end

				return true
			end,
		},
		{ name = "path" },
		{ name = "snippy" },
		{ name = "buffer" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "treesitter" },
		{ name = "crates" },
		{ name = "tmux" },
	}),
})
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local server_config_handler = require("plugins.lsp-completion.lspconfig.servers")
local default_opts = {
	on_attach = common_on_attach,
	lsp_flags = {
		debounce_text_changes = 150,
	},
	capabilities = cmp_nvim_lsp.default_capabilities(),
}
default_opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
default_opts.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
local server_config = server_config_handler(default_opts)
masonlsp.setup({
	ensure_installed = {},
	automatic_installation = false,
})

masonlsp.setup_handlers({
	function(server_name)
		local cfg = server_config[server_name]

		if not cfg then
			lspconfig[server_name].setup(default_opts)
			return
		end

		lspconfig[server_name].setup(server_config[server_name])
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = true,
		values = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		format = function(d)
			local code = d.code or (d.user_data and d.user_data.lsp.code)
			if code then
				return string.format("%s [%s]", d.message, code):gsub("1. ", "")
			end
			return d.message
		end,
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	focusable = true,
	style = "minimal",
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	focusable = true,
	style = "minimal",
	border = "rounded",
})
