return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {},
    lazy = false,
  }
}
