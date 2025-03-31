vim.lsp.enable({
  "lua",
  "typescript",
  "ruff",
  "python",
})

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local Snacks = require("snacks")
    local keymap = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    keymap("gd", function()
      Snacks.picker.lsp_definitions()
    end, "Goto Definition")

    keymap("gr", function()
      Snacks.picker.lsp_references()
    end, "Goto References")

    keymap("<leader>ds", function()
      Snacks.picker.lsp_symbols()
    end, "Document Symbols")

    keymap("<leader>rn", vim.lsp.buf.rename, "Rename")
    keymap("<c-l>", vim.lsp.buf.hover, "Documentation")
    keymap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    keymap("<leader>x", vim.diagnostic.open_float, "Show diagnostic")
    keymap("<leader>xx", vim.diagnostic.setloclist, "Show diagnostic in quickfix")
  end,
})
