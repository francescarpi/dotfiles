return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path'
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'pyright',
        'ruff_lsp',
        'eslint',
        'jsonls',
        'tailwindcss',
        'tsserver',
        'yamlls',
        'volar',
        'lua_ls',
        'cssls',
        'rust_analyzer',
        'angularls',
        'html',
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      }
    })

    -- ruff_lsp setup
    require('lspconfig').ruff_lsp.setup({
      init_options = {
        settings = { args = { "--line-length", "120" }, organizeImports = true, fixAll = true }
      }
    })

    local cmp = require('cmp')
    local cmp_format = lsp_zero.cmp_format()

    cmp.setup({
      formatting = cmp_format,
      mapping = cmp.mapping.preset.insert({
        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
    })

    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "jq",
        "isort",
        "black",
        "prettierd",
        "flake8",
      },
      automatic_installation = false,
      automatic_setup = true,
    })

    local nls = require("null-ls")
    nls.setup({
      debug = false,
      sources = {
        nls.builtins.diagnostics.flake8.with({
          extra_args = { "--max-line-length", "120" }
        }),
        nls.builtins.formatting.black,
      }
    })
  end
}
