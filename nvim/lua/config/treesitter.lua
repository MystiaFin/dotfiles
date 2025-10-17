local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "html", "css", "scss", "javascript", "typescript", "tsx",
      "json", "yaml", "toml", "graphql", "vue", "svelte", "php",

      "markdown", "markdown_inline", "regex", "query",

      "lua", "python", "java", "go", "ruby",

      "c", "cpp", "rust", "zig", "cmake", "make",

      "dockerfile", "bash", "vim", "sql",
    },
    sync_install = false,
    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
    },

    autotag = {
      enable = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    rainbow = {
      enable = true,
      extended_mode = true,
    },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })

  vim.cmd("TSEnable highlight")
end

return M
