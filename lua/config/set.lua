vim.opt.termguicolors = true
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-day")
-- vim.cmd.colorscheme("rose-pine")
vim.cmd.colorscheme("rose-pine-moon")

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

vim.opt.colorcolumn = "80"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.o.clipboard = "unnamedplus" -- use system clipboard on yank

vim.g.have_nerd_font = false

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
