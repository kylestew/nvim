return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			markdown = { "prettierd" },
			lua = { "stylua" },
			c = { "clang_format" },
			rust = { "rustfmt" },
			cpp = { "clang_format" },
			h = { "clang_format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Set default options
		default_format_ops = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = {
			timeout_ms = 500,
		},
	},
}

-- 		keys = {
-- 			{
-- 				"<leader>f",
-- 				function()
-- 					require("conform").format({ async = true, lsp_format = "fallback" })
-- 				end,
-- 				mode = "",
-- 				desc = "[F]ormat buffer",
-- 			},
-- 		},
-- 		opts = {
-- 			notify_on_error = false,
--
-- 			format_on_save = function(bufnr)
-- 				-- Disable "format_on_save lsp_fallback" for languages that don't
-- 				-- have a well standardized coding style. You can add additional
-- 				-- languages here or re-enable it for the disabled ones.
-- 				local disable_filetypes = {}
-- 				if disable_filetypes[vim.bo[bufnr].filetype] then
-- 					return nil
-- 				else
-- 					return {
-- 						timeout_ms = 500,
-- 						lsp_format = "fallback",
-- 					}
-- 				end
-- 			end,
--
-- 		},
-- 	},
