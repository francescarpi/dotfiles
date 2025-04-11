local path = require("mason-core.path")

return {
  cmd = { path.bin_prefix("vscode-json-language-server"), "--stdio" },
  filetypes = { "json", "jsonc" },
}
