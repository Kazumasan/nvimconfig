local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  sources = {
    {name = "buffer"},
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

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})
