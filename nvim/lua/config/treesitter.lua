require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
		"typescript",
		"javascript",
		"html",
		"css",
		"json",
		"tsx",
		"php",
		"svelte",
	},
	highlight = {
		enable = true,
	},
})

vim.defer_fn(function()
	vim.cmd("TSEnable highlight")
end, 100)
vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
