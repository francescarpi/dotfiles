local path = require("mason-core.path")

return {
  cmd = { path.bin_prefix("ruff"), "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
  },
}
