-- -----------------------------------------------------------------------------------------------
-- Plugins
-- -----------------------------------------------------------------------------------------------

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- Setup
require('lazy').setup({
  -- ------------------------------------------------------------------------------------------
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'monokai_pro'
    end,
  },

  -- ------------------------------------------------------------------------------------------
  { "kyazdani42/nvim-web-devicons" },

  -- ------------------------------------------------------------------------------------------
  { "lukas-reineke/indent-blankline.nvim", opts = {} },

  -- ------------------------------------------------------------------------------------------
  { "numToStr/Comment.nvim",               opts = {} },

  -- ------------------------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {
          statusline = { 'NvimTree' }
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }
  },

  -- ------------------------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      hijack_cursor = false,
      update_focused_file = {
        enable = true
      }
    }
  },

  -- ------------------------------------------------------------------------------------------
  {
    "TimUntersberger/neogit",
    opts = {
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    requires = { "sindrets/diffview.nvim" }
  },

  -- ------------------------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true
    }
  },

  -- ------------------------------------------------------------------------------------------
  { "tpope/vim-surround" },

  -- ------------------------------------------------------------------------------------------
  { "windwp/nvim-autopairs", opts = {} },

  -- ------------------------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim",         config = true },
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim",               opts = {} }, -- Useful status updates for LSP
      { "folke/neodev.nvim",               opts = {} }, -- Additional lua configuration, makes nvim stuff amazing!
      { "jose-elias-alvarez/null-ls.nvim", opts = {} },
      "jay-babu/mason-null-ls.nvim",
    }
  },

  -- ------------------------------------------------------------------------------------------
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },

  -- ------------------------------------------------------------------------------------------
  { "ThePrimeagen/harpoon", opts = {}, dependencies = { "nvim-lua/plenary.nvim" } },

  -- ------------------------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { ".git", "node_modules", ".venv" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous"
          }
        }
      }
    },
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- ------------------------------------------------------------------------------------------
  { "mbbill/undotree" },

  -- ------------------------------------------------------------------------------------------
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip", opts = {} },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

})
