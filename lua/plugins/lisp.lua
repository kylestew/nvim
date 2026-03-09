-- return {
-- 	"vlime/vlime",
-- 	rtp = "vim",
-- }

return {
	-- Conjure for Common Lisp
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "lisp", "scheme", "racket", "commonlisp" },
	},

	-- Rainbow parentheses
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("rainbow-delimiters.setup").setup()
		end,
	},
}
