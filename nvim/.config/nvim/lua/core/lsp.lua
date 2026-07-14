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


-- How to add a new language server:
-- 1. Go to https://github.com/neovim/nvim-lspconfig and find within the "lsp" folder the server you want to add
-- 2. Add your lsp file config in nvim/lsp folder

local servers = {
  astro = "astro-language-server",
  clang = "clangd",
  css = "css-lsp",
  csharp = "csharp-language-server",
  dockerfile = "dockerfile-language-server",
  eslint = "eslint-lsp",
  json = "json-lsp",
  luals = "lua-language-server",
  python = "jedi-language-server",
  ruff = "ruff",
  rust = "rust-analyzer",
  svelte = "svelte-language-server",
  typescript = "typescript-language-server",
  tailwindcss = "tailwindcss-language-server",
}

for name, _ in pairs(servers) do
  table.insert(M.files, name)
  table.insert(M.language_servers, name)
end

----------------------------------------------------------------------------
-- LSP Servers dispatch by filetype
-- Only enable the relevant servers when a buffer with that filetype is opened
----------------------------------------------------------------------------

-- filetype -> list of servers to enable for that filetype
local ft_servers = {
  astro = { "astro", "eslint", "tailwindcss" },
  c = { "clang" },
  cs = { "csharp" },
  css = { "css" },
  scss = { "css" },
  less = { "css" },
  dockerfile = { "dockerfile" },
  javascript = { "typescript", "eslint" },
  javascriptreact = { "typescript", "eslint" },
  ["javascript.jsx"] = { "typescript", "eslint" },
  typescript = { "typescript", "eslint" },
  typescriptreact = { "typescript", "eslint", "tailwindcss" },
  ["typescript.tsx"] = { "typescript", "eslint", "tailwindcss" },
  vue = { "eslint" },
  svelte = { "svelte", "eslint" },
  json = { "json" },
  jsonc = { "json" },
  lua = { "luals" },
  python = { "ruff", "python" },
  rust = { "rust" },
}

vim.lsp.enable(M.files)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lsp-ft-dispatch", { clear = true }),
  callback = function(args)
    local servers_to_enable = ft_servers[args.match]
    if servers_to_enable then
      vim.lsp.enable(servers_to_enable)
    end
  end,
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

    keymap("gl", function()
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
