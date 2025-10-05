return {
  {
    "williamboman/mason.nvim",
    event = "BufRead",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.32.0",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      vim.lsp.set_log_level("warn") -- Reduce log verbosity

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

      require("mason-lspconfig").setup_handlers({
        -- Default handler for all servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Custom handler for lua_ls
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  -- Disable workspace scanning entirely
                  library = {},
                  checkThirdParty = false,
                  -- Don't scan any files
                  maxPreload = 0,
                  preloadFileSize = 0,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
            -- Restrict to specific file patterns
            filetypes = { "lua" },
            -- Set root directory pattern to avoid scanning home directory
            root_dir = function(fname)
              local util = require("lspconfig.util")
              return util.root_pattern(
                ".luarc.json",
                ".luarc.jsonc",
                ".luacheckrc",
                ".stylua.toml",
                "stylua.toml",
                "selene.toml",
                "selene.yml",
                ".git"
              )(fname) or util.path.dirname(fname)
            end,
          })
        end,
      })

      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = true,      -- Show errors inline
        signs = true,             -- Show error signs in gutter
        underline = true,         -- Underline errors
        update_in_insert = false, -- Don't update diagnostics in insert mode
        severity_sort = true,     -- Sort by severity
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Auto-show diagnostics on cursor hold
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = 0,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })

      -- Key mappings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })

      -- Diagnostic key mappings
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
    end,
  },
}
