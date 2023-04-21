-- -----------------------------------------------------------------------------------------------
-- LSP
-- -----------------------------------------------------------------------------------------------

-- list of servers
local lsp_servers = {
  pyright = {},
  ruff_lsp = { settings = { args = { "--line-length", "120" }, organizeImports = true, fixAll = true } },
  eslint = {},
  jsonls = {},
  tailwindcss = {},
  tsserver = {},
  lua_ls = { Lua = { diagnostics = { globals = { "vim" } } } },
  yamlls = {},
  volar = {},
}

-- keymaps for each server
local server_maps = function(bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>fo", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

-- enable & configure servers
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  automatic_installation = true,
})

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
      null_ls.register(
			  null_ls.builtins.diagnostics.flake8
			)
    end
  }
})

-- register keymap for each server and configure them
for lsp, settings in pairs(lsp_servers) do
  require("lspconfig")[lsp].setup({
    on_attach = function(_, buffer)
      server_maps({ buffer = buffer })
    end,
    settings = settings,
    init_options = settings,
  })
end
