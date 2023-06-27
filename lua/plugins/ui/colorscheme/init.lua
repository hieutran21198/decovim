-- local gruvbox_ok, gruvbox = pcall(require, "gruvbox")
-- if gruvbox_ok then
-- 	gruvbox.setup({
-- 		transparent = true,
-- 	})
--
-- 	vim.cmd.colorscheme("gruvbox")
-- end

-- require("onedark").setup({
-- 	style = "deep",
-- })
--
-- vim.cmd.colorscheme("onedark")

require("bamboo").setup({
	code_style = {
		functions = "bold",
		keywords = "bold",
	},
})
require("bamboo").load()

-- require("catppuccin").setup({
-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	background = { -- :h background
-- 		light = "latte",
-- 		dark = "mocha",
-- 	},
-- 	transparent_background = false, -- disables setting the background color.
-- 	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
-- 	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 	dim_inactive = {
-- 		enabled = false, -- dims the background color of inactive window
-- 		shade = "dark",
-- 		percentage = 0.15, -- percentage of the shade to apply to the inactive window
-- 	},
-- 	no_italic = false, -- Force no italic
-- 	no_bold = false, -- Force no bold
-- 	no_underline = false, -- Force no underline
-- 	--    bold
-- 	-- 		underline
-- 	-- 		undercurl	curly underline
-- 	-- 		underdouble	double underline
-- 	-- 		underdotted	dotted underline
-- 	-- 		underdashed	dashed underline
-- 	-- 		strikethrough
-- 	-- 		reverse
-- 	-- 		inverse		same as reverse
-- 	-- 		italic
-- 	-- 		standout
-- 	-- 		altfont
-- 	-- 		nocombine	override attributes instead of combining them
-- 	-- 		NONE		no attributes used (used to reset it)
-- 	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 		comments = { "altfont", "italic" }, -- Change the style of comments
-- 		conditionals = { "bold" },
-- 		loops = { "bold" },
-- 		functions = { "bold" },
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 	},
-- 	color_overrides = {},
-- 	custom_highlights = {},
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		telescope = true,
-- 		notify = false,
-- 		mini = false,
-- 		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
-- 	},
-- })
--
-- -- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin")
