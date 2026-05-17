local pkgs = require("pkgs")

vim.pack.add(pkgs.add({
    -- Essential Dependencies
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",
  "rcarriga/nvim-notify",
  -- nvim-cmp
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  -- Plugins
  "catppuccin/nvim",
  "ellisonleao/gruvbox.nvim",
  "luisiacc/gruvbox-baby",
  "stevearc/oil.nvim",
  "neovim/nvim-lspconfig",
  "nvim-telescope/telescope.nvim",
  { "neovim-treesitter/nvim-treesitter", branch = "main" },
  "nvim-lualine/lualine.nvim",
  "andweeb/presence.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "lukas-reineke/indent-blankline.nvim",
  { "ThePrimeagen/harpoon", branch = "harpoon2" },
  "karb94/neoscroll.nvim",
  "lewis6991/gitsigns.nvim",
  "nvimdev/dashboard-nvim",
  "lervag/vimtex",
  "chomosuke/typst-preview.nvim",
  "zaldih/themery.nvim",
  "obsidian-nvim/obsidian.nvim",
	"MeanderingProgrammer/render-markdown.nvim",
	"folke/snacks.nvim",
	"neanias/everforest-nvim"
}))
