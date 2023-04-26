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
