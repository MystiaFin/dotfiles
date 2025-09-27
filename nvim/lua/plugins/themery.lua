return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"catppuccin",
				"rose-pine",
			},
			livePreview = true,
		})
	end,
}
