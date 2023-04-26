-- -----------------------------------------------------------------------------------------------
-- Packer
-- -----------------------------------------------------------------------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- --------------------------------------------------------------------------------------------
  use {
    'tanvirtin/monokai.nvim',
    config = function()
      vim.cmd.colorscheme("monokai_pro")
	  end
  }

  -- --------------------------------------------------------------------------------------------
  use 'nvim-tree/nvim-web-devicons'

  -- --------------------------------------------------------------------------------------------
  use 'lukas-reineke/indent-blankline.nvim'

  -- --------------------------------------------------------------------------------------------
  use 'numToStr/Comment.nvim'

  -- --------------------------------------------------------------------------------------------
  use 'nvim-lualine/lualine.nvim'

  -- --------------------------------------------------------------------------------------------
  use 'nvim-tree/nvim-tree.lua'

  -- --------------------------------------------------------------------------------------------
  use { 'TimUntersberger/neogit', requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }}

  -- --------------------------------------------------------------------------------------------
  use 'lewis6991/gitsigns.nvim'

  -- --------------------------------------------------------------------------------------------
  use 'tpope/vim-surround'

  -- --------------------------------------------------------------------------------------------
  use 'windwp/nvim-autopairs'

  -- --------------------------------------------------------------------------------------------
  use { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }

  -- --------------------------------------------------------------------------------------------
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- --------------------------------------------------------------------------------------------
  use 'mbbill/undotree'

  -- --------------------------------------------------------------------------------------------
	use {
	  'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = 'nvim-treesitter/nvim-treesitter-textobjects'
  }
  
  -- --------------------------------------------------------------------------------------------
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
    }
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
