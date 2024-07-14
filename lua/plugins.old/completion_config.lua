local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = "nvim_lsp"},
    {
      name = "buffer",
      keyword_length = 5,
      max_item_count = 5,
    },
    {
      name = "luasnip",
      max_item_count = 5,
    },
    {name = "path"}
  },
  preselect = cmp.PreselectMode.None,

  mapping = {
    ["<c-j>"] = cmp.mapping.select_next_item(),
    ["<c-h>"] = cmp.mapping.complete(),
    ["<c-k>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
})
