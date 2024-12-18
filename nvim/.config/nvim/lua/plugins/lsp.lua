local lsps = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          disable = { "missing-fields", "incomplete-signature-doc" },
          unusedLocalExclude = { "_*" },
        },
      },
    },
  },
  cssls = {},
  pyright = {},
  rust_analyzer = {},
  html = {},
  ["eslint-lsp"] = {},
  ["tailwindcss-language-server"] = {},
  ["json-lsp"] = {},
}

local linters = {
  "mypy",
}

local formatters = {
  "stylua",
  "isort",
  "ruff",
  "prettier",
  "black",
}

local combine_to_install = function()
  local combined = {}

  for key, _ in pairs(lsps) do
    table.insert(combined, key)
  end

  for _, linter in ipairs(linters) do
    table.insert(combined, linter)
  end

  for _, formatter in ipairs(formatters) do
    table.insert(combined, formatter)
  end

  return combined
end

local register_keys = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end

      map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
      map("gr", require("telescope.builtin").lsp_references, "Goto References")
      map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
      map("<leader>rn", vim.lsp.buf.rename, "Rename")
      map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("<leader>x", vim.diagnostic.open_float, "Show diagnostic")
      map("<leader>xx", vim.diagnostic.setloclist, "Show diagnostic in quickfix")
    end,
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      require("mason").setup()
      require("mason-tool-installer").setup({ ensure_installed = combine_to_install() })

      require("mason-lspconfig").setup({
        ensure_installed = lsps,
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server_config = lsps[server_name] or {}
            require("lspconfig")[server_name].setup(server_config)
          end,
        },
      })

      register_keys()
    end,
  },
}
