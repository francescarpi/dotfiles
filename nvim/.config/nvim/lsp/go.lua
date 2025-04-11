local path = require("mason-core.path")

return {
  cmd = { path.bin_prefix("gopls") },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
}
