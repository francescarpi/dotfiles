local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  pyright = {},
  ruff_lsp = { settings = { args = { "--line-length", "120" }, organizeImports = true, fixAll = true } },
  eslint = {},
  jsonls = {},
  tailwindcss = {},
  tsserver = {},
  lua_ls = { Lua = { diagnostics = { globals = { "vim" } } } },
  yamlls = {},
  volar = {},
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
