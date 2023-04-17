-- -- -----------------------------------------------------------------------------------------------
-- Neovim configuration
-- -----------------------------------------------------------------------------------------------

-- Set leader key
-- See: `:help mapleader`
-- NOTE: Must happen before. Plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lua.plugins")
