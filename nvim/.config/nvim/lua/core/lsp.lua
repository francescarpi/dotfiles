-- Attention. Mason (williamboman/mason.nvim) is required to install
-- lsp servers.
local path = require("mason-core.path")

---@param cmd string
local cmd = function(cmd)
  return path.concat({ vim.fn.stdpath("data"), "mason", "bin", cmd })
end

----------------------------------------------------------------------------
-- LSP Servers
----------------------------------------------------------------------------
local servers = {
  lua = {
    cmd = { cmd("lua-language-server") },
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
    cmd = { cmd("jedi-language-server") },
    filetypes = { "python" },
  },
  python_ruff = {
    cmd = { cmd("ruff"), "server" },
    filetypes = { "python" },
  },
  typescript = {
    cmd = { cmd("typescript-language-server"), "--stdio" },
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

    keymap("<leader>l", vim.lsp.buf.hover, "Documentation")

    keymap("<leader>x", vim.diagnostic.open_float, "Show diagnostic")
  end,
})
