return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		ls.add_snippets("python", {
			s({ trig = "ipdb", dscr = "Add the ipdb set_trace method" }, t("import ipdb; ipdb.set_trace()")),
		})

		ls.add_snippets("vue", {
			s("log", { t("console.log("), i(1), t(");") }),
		})

		ls.add_snippets("all", {
			s("º", t("->")),
			s("ºº", t("=>")),
		})
	end,
}
