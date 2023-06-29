local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

local actions = require("telescope.actions")

local options = {
	defaults = {
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
			find_files = {
				hidden = true,
				no_ignore = false,
				no_ignore_parent = false,
			},
		},
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.5,
				results_width = 0.5,
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
			width = 0.95,
			height = 0.95,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = {
				["q"] = actions.close,
				["<esc>"] = require("telescope.actions").close,
			},
			i = {
				-- ["<esc>"] = require("telescope.actions").close,
			},
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
}

telescope.setup(options)

pcall(function()
	telescope.load_extension("fzf")
end)

local all_recent = require("telescope-all-recent")

all_recent.setup({
	scoring = {
		recency_modifier = { -- also see telescope-frecency for these settings
			[1] = { age = 240, value = 100 }, -- past 4 hours
			[2] = { age = 1440, value = 80 }, -- past day
			[3] = { age = 4320, value = 60 }, -- past 3 days
			[4] = { age = 10080, value = 40 }, -- past week
			[5] = { age = 43200, value = 20 }, -- past month
			[6] = { age = 129600, value = 10 }, -- past 90 days
		},
		-- how much the score of a recent item will be improved.
		boost_factor = 0.0001,
	},

	default = {
		disable = true, -- disable any unknown pickers (recommended)
		use_cwd = true, -- differentiate scoring for each picker based on cwd
		sorting = "recent", -- sorting: options: 'recent' and 'frecency'
	},
})
