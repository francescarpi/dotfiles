-- -----------------------------------------------------------------------------------------------
-- Neovim configuration
-- -----------------------------------------------------------------------------------------------

-- Set leader key
-- See: `:help mapleader`
-- NOTE: Must happen before. Plugins are required
vim.g.mapleader = ','
vim.g.maplocalleader = ','

require("core.plugins")
require("core.options")
require("core.keymaps")
require("core.lsp")
require("core.treesitter")
require("core.cmp")
require("core.snippets")
