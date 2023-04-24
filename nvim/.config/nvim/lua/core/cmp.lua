local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "buffer",  keyword_length = 3 },
    { name = "luasnip", keyword_length = 2 },
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})
