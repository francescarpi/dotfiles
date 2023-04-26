local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
  s("ipdb", t("import ipdb; ipdb.set_trace()")),
})

ls.add_snippets("vue", {
  s("log", { t("console.log("), i(1), t(");") }),
})
