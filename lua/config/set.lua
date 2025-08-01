vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-day")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("rose-pine-moon")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false -- No line wrap

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.textwidth = 90
vim.opt.colorcolumn = "90"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.o.clipboard = "unnamedplus" -- use system clipboard on yank

vim.g.have_nerd_font = false

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Tree-sitter based folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- Optional: start with all folds open
vim.o.foldlevel = 99

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--- Don't auto add comment lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		-- remove r and o but leave c
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})
