local which_key = require("which-key")
local builtin = require("telescope.builtin")

-- Faster save + lint
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write Buffer" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Telescope Commands
which_key.add({
	{ "<leader>f", name = "[F]ind" },
	{ "<leader>ff", builtin.find_files, desc = "[F]ind [F]iles" },
	{ "<leader>fg", builtin.git_files, desc = "[F]ind [G]it Files" },
	{ "<leader>fs", builtin.live_grep, desc = "[F]ile [S]earch" },
	{ "<leader>fh", builtin.help_tags, desc = "[F]ind [H]elp" },
	{ "<leader>fd", builtin.diagnostics, desc = "[F]ind [D]iagnostics" },
	{ "<leader><leader>", builtin.buffers, desc = "[ ] Buffers" },
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
