-- --------------------------------------------------------------------------------------------
-- Lsp Zero
-- --------------------------------------------------------------------------------------------
local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'pyright',
  'ruff_lsp',
  'eslint',
  'jsonls',
  'tailwindcss',
  'tsserver',
  'yamlls',
  'volar',
  'lua_ls',
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').ruff_lsp.setup({
  init_options = {
    settings = { args = { "--line-length", "120" }, organizeImports = true, fixAll = true }
  }
})


lsp.setup()

-- --------------------------------------------------------------------------------------------
-- Mason null ls
-- --------------------------------------------------------------------------------------------
require("mason-null-ls").setup({
  ensure_installed = {
    "stylua",
    "jq",
    "isort",
    "black",
    "prettierd",
    "flake8",
  },
  automatic_installation = true,
  automatic_setup = true,
  handlers = {
    flake8 = function()
      local null_ls = require("null-ls")
      null_ls.register(null_ls.builtins.diagnostics.flake8.with({
        extra_args = {"--max-line-length", "120"}
      }))
    end,
  },
})
