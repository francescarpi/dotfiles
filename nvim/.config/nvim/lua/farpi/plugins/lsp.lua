return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      { "nvimtools/none-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "lua_ls",
          "graphql",
          "emmet_ls",
          "prismals",
          "pyright",
          "ruff_lsp",
          "eslint",
          "jsonls",
          "yamlls",
          "volar",
          "rust_analyzer",
          "angularls",
          "marksman",
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "black",
          "flake8",
          "eslint_d",
          "jq",
          "isort",
        },
      })

      local null_ls_utils = require("null-ls.utils")
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        -- add package.json as identifier for root (for typescript monorepos)
        root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
        -- setup formatters & linters
        sources = {
          formatting.prettier.with({
            extra_filetypes = { "svelte" },
          }),
          formatting.stylua,
          formatting.isort,
          formatting.black,
          -- diagnostics.flake8.with({
          --   extra_args = { "--max-line-length", "120" },
          -- }),
          -- diagnostics.eslint_d.with({
          --   condition = function(utils)
          --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
          --   end,
          -- }),
        },
      })
    end,
  },
}
