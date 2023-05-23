local M = {
	{
		"folke/neodev.nvim",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf" },
		},
		config = function()
			require("plugins.lsp-completion.neodev")
		end,
	},
	{
		"Exafunction/codeium.vim",
		config = function()
			require("plugins.lsp-completion.codeium")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("plugins.lsp-completion.symbols-outline")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.lsp-completion.null-ls")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.lsp-completion.autopairs")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.lsp-completion.treesitter")
		end,
	},
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("plugins.lsp-completion.comment")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "b0o/schemastore.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "williamboman/mason.nvim" },
			{ "ray-x/lsp_signature.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "dcampos/cmp-snippy" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{ "onsails/lspkind.nvim" },
			{ "dcampos/nvim-snippy" },
		},
		config = function()
			require("plugins.lsp-completion.lspconfig")
		end,
	},
	-- NOTE: disabled gitsigns because of poor performance
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("plugins.lsp-completion.gitsigns")
	-- 	end,
	-- },
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("plugins.lsp-completion.glow")
		end,
	},
	{
		"ray-x/go.nvim",
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
		config = function()
			require("plugins.lsp-completion.go")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("plugins.lsp-completion.refactoring")
		end,
	},
}

return M
