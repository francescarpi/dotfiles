local formatters = {
  json = { "jq" },
  lua = { "stylua" },
  typescriptreact = { "prettier" },
}

return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = formatters,
      init = function()
        -- formatexpr is used by vim when formatting code blocks usigg gq
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      end,
    },
  },
}
