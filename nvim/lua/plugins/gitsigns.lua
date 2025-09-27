return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "┃" },
			},
			numhl = true,
			linehl = false,
			word_diff = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "eol",
			},
		})
	end,
}
