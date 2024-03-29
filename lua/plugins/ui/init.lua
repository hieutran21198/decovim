local function init_common_colorscheme(name)
	return {
		name,
		config = function()
			require("plugins.ui.colorscheme")
		end,
	}
end

local M = {
	-- init_common_colorscheme("ellisonleao/gruvbox.nvim"),
	init_common_colorscheme("ellisonleao/gruvbox.nvim"),
	-- init_common_colorscheme("catppuccin/nvim"),
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.ui.colorizer")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.ui.barbecue")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.ui.which-key")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.ui.neo-tree")
		end,
	},
	{
		"ziontee113/icon-picker.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
		},
		config = function()
			require("plugins.ui.icon-picker")
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("plugins.ui.leap")
		end,
	},
	-- {
	-- 	"voldikss/vim-floaterm",
	-- 	config = function()
	-- 		require("plugins.ui.floaterm")
	-- 	end,
	-- },
	-- {
	-- 	"s1n7ax/nvim-terminal",
	-- 	config = function()
	-- 		require("plugins.ui.terminal")
	-- 	end,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{
				"linrongbin16/lsp-progress.nvim",
				event = { "VimEnter" },
				dependencies = { "nvim-tree/nvim-web-devicons" },
			},
		},
		config = function()
			require("plugins.ui.lualine")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			{ "kkharji/sqlite.lua" },
			{ "prochri/telescope-all-recent.nvim" },
		},
		tag = "0.1.1",
		config = function()
			require("plugins.ui.telescope")
		end,
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("plugins.ui.illuminate")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("plugins.ui.bufferline")
		end,
	},
	{
		"famiu/bufdelete.nvim",
	},
	{
		"m4xshen/smartcolumn.nvim",
		config = function()
			require("plugins.ui.smartcolumn")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.ui.toggleterm")
		end,
	},
	-- {
	-- 	"ldelossa/nvim-ide",
	-- 	config = function()
	-- 		require("plugins.ui.ide")
	-- 	end,
	-- },
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("plugins.ui.noice")
	-- 	end,
	-- },
}

return M
