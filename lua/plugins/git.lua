return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next [C]hange" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Prev [C]hange" })

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[S]tage hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[R]eset hunk" })

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[S]tage hunk" })

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[R]eset hunk" })

				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[S]tage buffer" })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[R]eset buffer" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[P]review hunk" })
				map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk [I]nline" })

				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "[B]lame line" })

				map("n", "<leader>hd", gitsigns.diffthis, { desc = "[D]iff this" })

				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "[D]iff this (~)" })

				map("n", "<leader>hQ", function()
					gitsigns.setqflist("all")
				end, { desc = "[Q]uickfix (all)" })
				map("n", "<leader>hq", gitsigns.setqflist, { desc = "[Q]uickfix" })

				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle [B]lame" })
				map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle [W]ord diff" })

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select [H]unk" })
			end,
		})
	end,
}
