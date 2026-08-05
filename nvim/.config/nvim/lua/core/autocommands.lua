vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("no-complete-in-special-buffers", { clear = true }),
  callback = function(ev)
    local buftype = vim.bo[ev.buf].buftype
    if buftype ~= "prompt" and buftype ~= "nofile" then
      return
    end

    -- 1. Native Neovim 0.11+ completion
    vim.bo[ev.buf].autocomplete = false
    vim.opt_local.complete = ""

    -- 2. Copilot (loaded globally, must be disabled per-buffer)
    if vim.g.loaded_copilot then
      pcall(vim.cmd, "Copilot disable")
    end

    -- 3. LSP completion (defensive — usually not attached, but just in case)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
      vim.lsp.completion.enable(false, client.id, ev.buf)
    end
  end,
})
