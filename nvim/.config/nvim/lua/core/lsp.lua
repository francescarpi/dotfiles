-- Attention. Mason (williamboman/mason.nvim) is required to install
-- lsp servers.
local path = require("mason-core.path")

---@param cmd string
local cmd = function(cmd)
  return path.concat({ vim.fn.stdpath("data"), "mason", "bin", cmd })
end

----------------------------------------------------------------------------
-- Common for all LSPs
----------------------------------------------------------------------------
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  single_file_support = true,
})

----------------------------------------------------------------------------
-- LSP Servers
----------------------------------------------------------------------------
local servers = {
  lua = {
    cmd = { cmd("lua-language-server") },
    filetypes = { "lua" },
    root_markers = {
      ".luarc.json",
      ".luarc.jsonc",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      "selene.yml",
    },
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
    root_markers = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
    },
  },
  python_ruff = {
    cmd = { cmd("ruff"), "server" },
    filetypes = { "python" },
    root_markers = {
      "pyproject.toml",
      "ruff.toml",
      ".ruff.toml",
    },
  },
  typescript = {
    cmd = { cmd("typescript-language-server"), "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    root_markers = {
      "tsconfig.json",
      "jsconfig.json",
      "package.json",
    },
  },
  json = {
    cmd = { cmd("vscode-json-language-server"), "--stdio" },
    filetypes = { "json", "jsonc" },
  },
  go = {
    cmd = { cmd("gopls") },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
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
