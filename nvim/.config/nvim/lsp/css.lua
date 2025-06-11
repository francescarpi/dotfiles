return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  init_options = { provideFormatter = true },
  single_file_support = true,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = { validate = true },
    less = { validate = true },
  },
  root_markers = {
    "pacjage.json",
    ".git",
  },
}
