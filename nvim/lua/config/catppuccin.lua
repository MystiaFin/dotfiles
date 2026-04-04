require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	term_colors = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		functions = { "italic" },
		keywords = { "italic" },
		strings = { "italic" },
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		treesitter = true,
		nvimtree = true,
		which_key = true,
	},
})
vim.cmd.colorscheme("catppuccin")

-- Force Telescope transparency
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE" })
