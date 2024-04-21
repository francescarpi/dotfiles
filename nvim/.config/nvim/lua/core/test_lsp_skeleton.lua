local client = vim.lsp.start_client({
  name = "lsp_skeleton",
  cmd = { "/Users/farpi/dev/lsp-skeleton/target/debug/lsp-skeleton" },
  on_attach = require("plugins.lsp").on_attach,
})

if not client then
  vim.notify("Failed to start lsp_skeleton")
  return
end
