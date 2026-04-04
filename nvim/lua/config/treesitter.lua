require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"typescript",
					"javascript",
					"html",
					"css",
					"json",
					"tsx",
					"php",
				},
				highlight = {
					enable = true,
				},
			})

			vim.defer_fn(function()
				vim.cmd("TSEnable highlight")
			end, 100)
