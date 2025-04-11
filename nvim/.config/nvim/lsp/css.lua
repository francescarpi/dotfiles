local path = require("mason-core.path")

return {
  cmd = { path.bin_prefix("vscode-css-language-server"), "--stdio" },
  filetypes = { "css", "scss", "less" },
  init_options = { provideFormatter = true },
  single_file_support = true,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
