local map = function(modes, keys, func, desc)
  vim.keymap.set(modes, keys, func, { desc = desc, silent = true })
end

local map_n = function(keys, func, desc)
  map("n", keys, func, desc)
end

local map_i = function(keys, func, desc)
  map("i", keys, func, desc)
end

local map_v = function(keys, func, desc)
  map("v", keys, func, desc)
end

local map_x = function(keys, func, desc)
  map("x", keys, func, desc)
end

local map_all = function(keys, func, desc)
  map({ "i", "x", "n", "s" }, keys, func, desc)
end

map_n("<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")
map_i("<C-c>", "<esc>", "Exit to normal mode")
map_n("<C-m>", "<cmd>e #<cr>", "Switch to other buffer")
map_n("<leader>q", ":bdelete<CR>", "Delete current buffer")
map_all("<C-s>", "<cmd>w<cr><esc>", "Save file")
map_n("<C-j>", "<cmd>m .+1<cr>==", "Line: Move Down")
map_n("<C-k>", "<cmd>m .-2<cr>==", "Line: Move Up")
map_i("<C-j>", "<esc><cmd>m .+1<cr>==gi", "Line: Move Down")
map_i("<C-k>", "<esc><cmd>m .-2<cr>==gi", "Line: Move Up")
map_v("<C-j>", ":m '>+1<cr>gv=gv", "Line: Move Down")
map_v("<C-k>", ":m '<-2<cr>gv=gv", "Line: Move Up")
map_n("<C-d>", "<C-d>zz", "Page down and center scroll")
map_n("<C-u>", "<C-u>zz", "Page up and center scroll")
map_n("n", "nzzzv", "Search next and center scroll")
map_n("N", "Nzzzv", "Search previous and center scroll")
map_n("[q", ":cprev<CR>", "Quickfix: Previous result")
map_n("]q", ":cnext<CR>", "Quickfix: Next result")
map_n("<leader>co", ":copen<cr>", "Quickfix: Open")
map_n("<leader>cc", ":cclose<cr>", "Quickfix: Close")
map_n("<space><space>x", "<cmd>source %<CR>", "Lua: Execute file")
map_n("<space>x", ":.lua<CR>", "Lua: Execute line")
map_v("<space>x", ":lua<CR>", "Lua: Execute selection")
map_x("<leader>p", [["_dP]], "Paste delete selected and paste")
