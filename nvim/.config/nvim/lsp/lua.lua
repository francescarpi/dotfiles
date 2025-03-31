return {
  -- brew install lua-language-server
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        disable = {
          "missing-fields",
          "incomplete-signature-doc",
          "undefined-global",
        },
        unusedLocalExclude = { "_*" },
      },
      runtime = { version = "LuaJIT" },
    },
  },
}
