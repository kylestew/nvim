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
			json = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			toml = { "tombi" },
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
