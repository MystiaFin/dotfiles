return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- Make sure it loads first
		config = function()
			require("rose-pine").setup({
				disable_background = true, -- Enable transparency
				disable_float_background = true, -- Optional: Transparent floating windows
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
