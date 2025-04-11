local utils = require("core.utils")

return {
  cmd = { utils.mason_bin("docker-langserver"), "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = {
    "Dockerfile",
  },
}
