local os = vim.loop.os_uname()

DECOVIM = {
	lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
}

if os == "Windows" then
	return
end

if vim.g.vscode then
	-- vscode extension
	--
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	vim.opt.clipboard = "unnamedplus"

	vim.cmd([[source $HOME/.config/nvim/vscode/settings.vim]])
	return
end

local utils = require("utils")

local plugins = utils.combine_plugins(function()
	return {
		editor = require("plugins.editor"),
		lsp_completion = require("plugins.lsp-completion"),
		test_debug = require("plugins.test-debug"),
		ui = require("plugins.ui"),
	}
end)

if not vim.loop.fs_stat(DECOVIM.lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		DECOVIM.lazypath,
	})
end

vim.opt.rtp:prepend(DECOVIM.lazypath)

DECOVIM.start = function()
	require("autocmds")

	local lazy_ok, lazy = pcall(require, "lazy")
	if not lazy_ok then
		return
	end

	local vim_default = require("vim-default")

	for k, v in pairs(vim_default.g) do
		vim.g[k] = v
	end

	for k, v in pairs(vim_default.opts) do
		vim.opt[k] = v
	end

	lazy.setup(plugins)
end

DECOVIM.start()
