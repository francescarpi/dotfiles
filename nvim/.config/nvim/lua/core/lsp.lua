----------------------------------------------------------------------------
-- Common for all LSPs
----------------------------------------------------------------------------
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  single_file_support = true,
})

----------------------------------------------------------------------------
-- LSP Servers
-- Config files are in the `lsp` folder
----------------------------------------------------------------------------
vim.lsp.enable({
  "css",
  "dockerfile",
  "eslint",
  "go",
  "json",
  "luals",
  "python",
  "ruff",
  "rust",
  "typescript",
})

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
