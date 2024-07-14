return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers {
          -- The first entry (without a key) will be the default handler
          -- and will be called for each installed server that doesn't have
          -- a dedicated handler.
          function (server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {}
          end,
          -- Next, you can provide a dedicated handler for specific servers.
          -- For example, a handler override for the `rust_analyzer`:
          -- ["rust_analyzer"] = function ()
          --  require("rust-tools").setup {}
          -- end
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require('cmp') 
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-k>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          ['<CR>'] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
              else
                fallback()
              end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      -- Set up lspconfig.
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        -- capabilities = capabilities
      -- }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  }
}
