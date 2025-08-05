return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	opts = {
		defaults = {
			-- hide everything *inside* .git/ but still show .gitignore
			file_ignore_patterns = { "^%.git/" },
		},
		pickers = {
			-- ① normal file search: respect .gitignore **and** show dot-files
			find_files = {
				hidden = true, -- include “.env”, “.gitignore”, …
				no_ignore = false, -- still read .gitignore /.ignore
				no_ignore_parent = false, -- look at parent dirs too
			},
		},
	},

	-- config = function()
	-- 	-- See `:help telescope.builtin`
	-- 	local builtin = require("telescope.builtin")
	-- 	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	--
	-- 	-- -- Optional Enhancements
	-- 	-- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep Current Word" }) -- Grep word under cursor
	-- 	-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" }) -- Vim help
	-- 	-- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" }) -- LSP errors
	-- 	-- vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" }) -- Recently opened
	-- 	-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search Keymaps" }) -- View all keys
	-- 	-- vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Search Telescope Actions" }) -- Meta search
	-- end,
}
