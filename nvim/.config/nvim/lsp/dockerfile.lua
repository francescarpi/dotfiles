local path = require("mason-core.path")

return {
  cmd = { path.bin_prefix("docker-langserver"), "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = {
    "Dockerfile",
  },
}
