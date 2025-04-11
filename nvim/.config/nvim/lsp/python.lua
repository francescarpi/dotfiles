local utils = require("core.utils")

return {
  cmd = { utils.mason_bin("jedi-language-server") },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
  },
}
