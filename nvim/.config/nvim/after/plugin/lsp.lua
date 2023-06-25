-- --------------------------------------------------------------------------------------------
-- Lsp Zero
-- --------------------------------------------------------------------------------------------
local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

-- servers
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
  'cssls',
  'rust_analyzer',
  'angularls',
  'html',
})

-- lua_ls setup
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- ruff_lsp setup
require('lspconfig').ruff_lsp.setup({
  init_options = {
    settings = { args = { "--line-length", "120" }, organizeImports = true, fixAll = true }
  }
})

lsp.nvim_workspace()
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
  automatic_installation = false,
  automatic_setup = true,
})

local nls = require("null-ls")
nls.setup({
  debug = false,
  sources = {
    nls.builtins.diagnostics.flake8.with({
      extra_args = { "--max-line-length", "120" }
    }),
    nls.builtins.formatting.black,
  }
})
