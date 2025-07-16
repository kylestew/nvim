local which_key = require("which-key")
local builtin = require("telescope.builtin")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Telescope Commands

which_key.add({
	{ "<leader>ff", builtin.find_files, desc = "[F]ind [F]iles" },
	{ "<leader>fg", builtin.git_files, desc = "[F]ind [G]it Files" },
	{ "<leader>fs", builtin.live_grep, desc = "[F]ile [S]earch" },
	{ "<leader>fh", builtin.help_tags, desc = "[F]ind [H]elp" },
	{ "<leader>fd", builtin.diagnostics, desc = "[F]ind [D]iagnostics" },
	{ "<leader><leader>", builtin.buffers, desc = "[ ] Find in Buffers" },
})
-- TODO: make above the "[F]ind" group

-- Slightly advanced example of overriding default behavior and theme
-- TODO: add to whichkey
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
-- TODO: remove "[S]earch group"

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

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--
-- -- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
