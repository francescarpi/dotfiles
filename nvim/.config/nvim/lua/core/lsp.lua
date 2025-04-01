----------------------------------------------------------------------------
-- LSP Servers
----------------------------------------------------------------------------
local servers = {
  lua = {
    cmd = { "lua-language-server" }, -- brew install lua-language-server
    filetypes = { "lua" },
    settings = {
      Lua = {
        diagnostics = {
          disable = {
            "missing-fields",
            "incomplete-signature-doc",
            "undefined-global",
          },
          unusedLocalExclude = { "_*" },
        },
        runtime = { version = "LuaJIT" },
      },
    },
  },
  python = {
    cmd = { "jedi-language-server" }, -- installed manually at $HOME/.lspservers/.venv/bin/jedi-language-server
    filetypes = { "python" },
  },
  python_ruff = {
    cmd = { "ruff", "server" }, -- brew install ruff
    filetypes = { "python" },
  },
  typescript = {
    cmd = { "typescript-language-server", "--stdio" }, -- brew install typescript-language-server
    filetypes = { "typescriptreact", "typescript", "javascript" },
  },
}

for name, config in pairs(servers) do
  vim.lsp.config[name] = config
  vim.lsp.enable(name)
end

----------------------------------------------------------------------------
-- Diagnostics
----------------------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = { current_line = true },
})

----------------------------------------------------------------------------
-- LSP Attach
----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", {}),
  callback = function(ev)
    -- Completion
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end

    -- Keymaps
    local snacks = require("snacks")
    local keymap = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
    end

    keymap("gO", function()
      snacks.picker.lsp_symbols()
    end, "Document Symbols")

    keymap("gd", function()
      snacks.picker.lsp_definitions()
    end, "Goto Definition")

    keymap("<c-l>", vim.lsp.buf.hover, "Documentation")

    keymap("<leader>x", vim.diagnostic.open_float, "Show diagnostic")
  end,
})
