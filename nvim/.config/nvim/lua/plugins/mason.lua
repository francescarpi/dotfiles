local lsp = require("core.lsp")

return {
  {
    "mason-org/mason.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    lazy = true,
    event = "VeryLazy",
    opts = {
      ensure_installed = lsp.language_servers,
    },
  },
}
