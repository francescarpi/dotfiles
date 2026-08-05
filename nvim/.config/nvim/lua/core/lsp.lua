local M = {
  files = {},
  language_servers = {},
}

----------------------------------------------------------------------------
-- Common for all LSPs
----------------------------------------------------------------------------
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
  roslyn = "roslyn-language-server",
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
    -- Attach LSP completions
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Register keybindings
    local snacks = require("snacks")

    vim.keymap.set("n", "gl", function()
      snacks.picker.lsp_symbols()
    end, { buffer = ev.buf, desc = "LSP: Document symbols" })

    vim.keymap.set("n", "gd", function()
      snacks.picker.lsp_definitions()
    end, { buffer = ev.buf, desc = "LSP: Goto definition" })

    vim.keymap.set("n", "<leader>l", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP: Documentation" })

    vim.keymap.set("i", "<c-l>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "LSP: Signature help" })

    vim.keymap.set("n", "<leader>x", vim.diagnostic.open_float, { buffer = ev.buf, desc = "LSP: Show diagnostic" })
  end,
})

return M
