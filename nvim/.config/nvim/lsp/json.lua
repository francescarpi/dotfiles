local utils = require("core.utils")

return {
  cmd = { utils.mason_bin("vscode-json-language-server"), "--stdio" },
  filetypes = { "json", "jsonc" },
}
