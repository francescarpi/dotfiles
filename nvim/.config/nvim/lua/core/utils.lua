local M = {}

-- Attention. Mason (williamboman/mason.nvim) is required to install
-- lsp servers.
local path = require("mason-core.path")

---@param cmd string
M.mason_bin = function(cmd)
  return path.concat({ vim.fn.stdpath("data"), "mason", "bin", cmd })
end

return M
