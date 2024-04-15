return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "isort",
      "ruff",
      "mypy",
      "codelldb",
      "cpptools",
      "prettier",
      "eslint-lsp",
      "grammarly-languageserver"
    },
  },
}
