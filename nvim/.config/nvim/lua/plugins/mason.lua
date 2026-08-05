local lsp = require("core.lsp")

return {
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    lazy = false,
    opts = {
      ensure_installed = lsp.mason,
      auto_update = true,
    },
  },
}
