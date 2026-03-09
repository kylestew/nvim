local which_key = require("which-key")
local builtin = require("telescope.builtin")

-- Faster save + lint
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write Buffer" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Telescope Commands
local builtin = require("telescope.builtin")

-- Smart: git files if in repo, else all files
local function smart_files()
	local ok = pcall(builtin.git_files, { show_untracked = true })
	if not ok then
		builtin.find_files({ hidden = true })
	end
end

which_key.add({
	{ "<leader>f", name = "[F]ind" },

	-- Files
	{ "<leader>ff", smart_files, desc = "[F]iles (smart: git or all)" },
	{ "<leader>fF", builtin.find_files, desc = "[F]iles (all)" },
	{ "<leader>fG", builtin.git_files, desc = "[G]it files" },

	-- Grep
	{ "<leader>fg", builtin.live_grep, desc = "[G]rep project" },
	{ "<leader>fw", builtin.grep_string, desc = "[W]ord grep (under cursor)" },

	-- Misc
	{ "<leader>fh", builtin.help_tags, desc = "[H]elp" },
	{ "<leader>fd", builtin.diagnostics, desc = "[D]iagnostics" },

	{ "<leader><leader>", builtin.buffers, desc = "Buffers" },
})

-- Slightly advanced example of overriding default behavior and theme
-- TODO: add to whichkey
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzy find buffer" })

-- Open Cursor for current file
vim.keymap.set("n", "<leader>ai", ":!cursor . %<CR>", { desc = "Open file in Cursor" })

-- Primeagen commands

-- greatest remap ever
which_key.add({
	{ "<leader>p", "_dP", mode = "x", desc = "Paste and void" },
	{ "<leader>d", "_d", mode = "n", desc = "Delete to void" },
	{ "<leader>d", "_d", mode = "v", desc = "Delete to void" },
})

-- Small Terminal
which_key.add({
	"<leader>st",
	function()
		vim.cmd.vnew()
		vim.cmd.term()
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 12)
	end,
	desc = "[S]mall [T]erminal",
})

-- Easy Exit Terminal
vim.keymap.set("t", "<Esc><Esc>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
	vim.cmd("bd!") -- close buffer (terminal window)
end, { desc = "Escape and close terminal" })

-- Rust Run

which_key.add({
	{ "<leader>r", name = "[R]ust" },
})
vim.keymap.set("n", "<leader>rr", function()
	vim.cmd("w") -- Save file first
	vim.cmd("belowright split | term cargo run")
	vim.cmd("startinsert")
end, { desc = "Cargo Run" })
vim.keymap.set("n", "<leader>rt", function()
	vim.cmd("w") -- Save file first
	vim.cmd("belowright split | term cargo test")
	vim.cmd("startinsert")
end, { desc = "Cargo Test" })
vim.keymap.set("n", "<leader>rw", function()
	vim.cmd("belowright split | term cargo watch -x test")
end, { desc = "Watch Tests" })

-- C Build

which_key.add({
	{ "<leader>m", name = "[M]ake" },
})
vim.keymap.set("n", "<leader>mm", ":make<CR>", { desc = "Make" })
vim.keymap.set("n", "<leader>mr", ":make run<CR>", { desc = "Run" })
vim.keymap.set("n", "<leader>mc", ":make clean<CR>", { desc = "Clean" })
-- vim.keymap.set("n", "<leader>mm", function()
-- 	vim.cmd("w") -- Save file first
-- 	vim.cmd("belowright split | term make")
-- 	vim.cmd("startinsert")
-- end, { desc = "Make" })
-- vim.keymap.set("n", "<leader>mr", function()
-- 	vim.cmd("w") -- Save file first
-- 	vim.cmd("belowright split | term make run")
-- 	vim.cmd("startinsert")
-- end, { desc = "Make Run" })
-- vim.keymap.set("n", "<leader>mc", function()
-- 	vim.cmd("w") -- Save file first
-- 	vim.cmd("belowright split | term make clean")
-- 	vim.cmd("startinsert")
-- end, { desc = "Make Clean" })

-- Show diagnostics in a floating window
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostics for current line" })

-- Show diagnostic quick fix list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- -- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Format ASM file with nice65
vim.keymap.set("n", "<leader>af", ":%!nice65 -<CR>", { desc = "Format ASM file (nice65)" })
