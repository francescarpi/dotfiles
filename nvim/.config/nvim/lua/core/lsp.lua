local M = {
  files = {},
  language_servers = {},
}

----------------------------------------------------------------------------
-- Common for all LSPs
----------------------------------------------------------------------------
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  single_file_support = true,
})

local servers = {
  clang = "clangd",
  css = "css-lsp",
  csharp = "csharp-language-server",
  dockerfile = "dockerfile-language-server",
  eslint = "eslint-lsp",
  go = "gopls",
  json = "json-lsp",
  luals = "lua-language-server",
  python = "jedi-language-server",
  ruff = "ruff",
  rust = "rust-analyzer",
  typescript = "typescript-language-server",
  tailwindcss = "tailwindcss-language-server",
}

for file, lsp in pairs(servers) do
  table.insert(M.files, file)
  table.insert(M.language_servers, lsp)
end

----------------------------------------------------------------------------
-- LSP Servers
-- Config files are in the `lsp` folder
----------------------------------------------------------------------------
vim.lsp.enable(M.files)

----------------------------------------------------------------------------
-- Diagnostics
----------------------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = { current_line = true },
})

----------------------------------------------------------------------------
-- LSP Attach
-- This is where we set up the keymaps for LSP
----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", {}),
  callback = function(ev)
    -- Keymaps
    local snacks = require("snacks")
    local keymap = function(keys, func, desc, mode)
      if mode == nil then
        mode = "n"
      end
      vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
    end

    keymap("gO", function()
      snacks.picker.lsp_symbols()
    end, "Document Symbols")

    keymap("gd", function()
      snacks.picker.lsp_definitions()
    end, "Goto Definition")

    keymap("<leader>l", vim.lsp.buf.hover, "Documentation")
    keymap("<c-l>", vim.lsp.buf.signature_help, "Signature Help", "i")

    keymap("<leader>x", vim.diagnostic.open_float, "Show diagnostic")
  end,
})

return M
