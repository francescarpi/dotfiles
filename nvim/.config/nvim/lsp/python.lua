local path = require("mason-core.path")

return {
  cmd = { path.bin_prefix("jedi-language-server") },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
  },
}
