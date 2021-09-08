local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  sources = {
    {name = "buffer" },
    {name = "nvim_lsp"},
    {name = "luansip"},
    {name = "path"}
  },
  preselect = cmp.PreselectMode.None,

  mapping = {
    ["<c-j>"] = cmp.mapping.select_next_item(),
    ["<c-h>"] = cmp.mapping.complete(),
    ["<c-k>"] = cmp.mapping.select_prev_item(),
    ["<TAB>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true})
  }
})
