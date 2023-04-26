-- -----------------------------------------------------------------------------------------------
-- Neovim configuration
-- Inspired on ThePrimeagen repo
-- -----------------------------------------------------------------------------------------------

-- Set leader key
-- NOTE: Must happen before. Plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("core.packer")
require("core.set")
require("core.remap")

