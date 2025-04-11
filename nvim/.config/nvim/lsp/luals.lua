local utils = require("core.utils")

return {
  cmd = { utils.mason_bin("lua-language-server") },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
  },
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
