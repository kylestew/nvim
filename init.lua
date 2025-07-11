vim.g.mapleader = " "

require("config.lazy")
require("config.remap")
require("config.set")

-- https://github.com/VVoruganti/dotfiles/tree/master/neovim/lua/marshmalon

-- -- Highlight when yanking (copying) text
-- --  Try it with `yap` in normal mode
-- --  See `:help vim.hl.on_yank()`
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	desc = "Highlight when yanking (copying) text",
-- 	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
-- 	callback = function()
-- 		vim.hl.on_yank()
-- 	end,
-- })
--
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
-- local opts = {}
--
-- require("lazy").setup(plugins, opts)
--
-- -- -- Tree-sitter based folding
-- -- vim.o.foldmethod = "expr"
-- -- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- -- -- Optional: start with all folds open
-- -- vim.o.foldlevel = 99
