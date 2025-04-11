local utils = require("core.utils")

return {
  cmd = { utils.mason_bin("gopls") },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
}
