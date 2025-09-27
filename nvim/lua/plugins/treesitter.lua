return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  config = function()
    require("config.treesitter").setup()
  end,
}
