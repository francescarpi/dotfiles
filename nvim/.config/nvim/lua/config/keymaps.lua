-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https:https//github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("n", "<C-m>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>k", ":bdelete<CR>", { silent = true, desc = "Delete current buffer" })
