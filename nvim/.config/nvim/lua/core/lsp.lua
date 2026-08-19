-- -------------------------------------------------------
-- LSP Servers List
-- -------------------------------------------------------
local servers = {
  lua_ls = {
    mason = "lua-language-server",
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
  astro = {
    mason = "astro-language-server",
  },
  cssls = {
    mason = "css-lsp",
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      scss = { validate = true },
      less = { validate = true },
    },
  },
  ts_ls = {
    mason = "typescript-language-server",
  },
  tailwindcss = {
    mason = "tailwindcss-language-server",
    settings = {
      tailwindCSS = {
        validate = true,
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidScreen = "error",
          invalidVariant = "error",
          invalidConfigPath = "error",
          invalidTailwindDirective = "error",
          recommendedVariantOrder = "warning",
        },
        classAttributes = {
          "class",
          "className",
          "class:list",
          "classList",
          "ngClass",
        },
        includeLanguages = {
          eelixir = "html-eex",
          eruby = "erb",
          templ = "html",
          htmlangular = "html",
        },
      },
    },
  },
  roslyn_ls = {
    mason = "roslyn-language-server",
  },
  gopls = {
    mason = "gopls",
  },
}

-- -------------------------------------------------------
-- LSP Module Configuration
-- -------------------------------------------------------
local M = {
  mason = {},
  lsp = {},
}

for name, data in pairs(servers) do
  table.insert(M.lsp, name)
  table.insert(M.mason, data.mason)

  if data.settings ~= nil then
    vim.lsp.config(name, {
      settings = data.settings,
    })
  end
end

vim.lsp.enable(M.lsp)

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", {}),
  callback = function(ev)
    -- Enables completion if it's allowed by the LSP
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
