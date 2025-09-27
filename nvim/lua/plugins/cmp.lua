return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'
      require("luasnip.loaders.from_vscode").load()
      cmp.setup {
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-j>'] = cmp.mapping.scroll_docs(-4),
          ['<C-k>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'luasnip' },
          { name = 'buffer' },
        },
      }
    end
  },
}
