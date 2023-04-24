local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("python", {
  s("ipdb", t"import ipdb; ipdb.set_trace()" ),
})
