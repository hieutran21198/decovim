-- local gruvbox_ok, gruvbox = pcall(require, "gruvbox")
-- if gruvbox_ok then
-- 	gruvbox.setup({
-- 		transparent = true,
-- 	})
--
-- 	vim.cmd.colorscheme("gruvbox")
-- end

require("onedark").setup({
	style = "deep",
})

vim.cmd.colorscheme("onedark")
