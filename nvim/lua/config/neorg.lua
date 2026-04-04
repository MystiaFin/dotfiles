require("neorg").setup {
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "diamond",
			}
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
		["core.summary"] = {
			config = {
				strategy = "by_path",
				-- "friendly" is correct! It creates the {:link:}[text] structure
				link_format = "friendly"
			},
		},
		["core.esupports.indent"] = {},
		["core.integrations.treesitter"] = {},
		["core.export"] = {},
		["core.tangle"] = {},
	},
}
vim.opt.conceallevel = 2
