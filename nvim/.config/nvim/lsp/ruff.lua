local utils = require("core.utils")

return {
  cmd = { utils.mason_bin("ruff"), "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
  },
}
