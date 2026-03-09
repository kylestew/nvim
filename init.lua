vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("config.lazy")
require("config.remap")
require("config.set")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.asm", "*.s" },
	command = "set filetype=asmM6502",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.fs", "*.forth", "*.fth" },
	callback = function()
		vim.bo.filetype = "forth"
	end,
})

-- https://github.com/VVoruganti/dotfiles/tree/master/neovim/lua/marshmalon

-- local plugins = {
-- 	{
-- 		-- Main LSP Configuration
-- 		"neovim/nvim-lspconfig",
-- 		dependencies = {
-- 			-- Automatically install LSPs and related tools to stdpath for Neovim
-- 			-- Mason must be loaded before its dependents so we need to set it up here.
-- 			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
-- 			{ "mason-org/mason.nvim", opts = {} },
-- 			"mason-org/mason-lspconfig.nvim",
-- 			"WhoIsSethDaniel/mason-tool-installer.nvim",
--
-- 			-- Useful status updates for LSP.
-- 			{ "j-hui/fidget.nvim", opts = {} },
--
-- 			-- Allows extra capabilities provided by blink.cmp
-- 			"saghen/blink.cmp",
-- 		},
-- 	},
--
-- 	{ "tidalcycles/vim-tidal" },
-- }
