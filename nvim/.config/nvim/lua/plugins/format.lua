local uv = vim.uv or vim.loop

local formatters = {
  json = { "jq" },
  lua = { "stylua" },
  typescriptreact = { "prettier" },
  typescript = { "prettier" },
}

local function find_in_ancestors(filename, startpath)
  local dir = uv.fs_realpath(startpath or vim.fn.getcwd())
  while dir do
    local candidate = dir .. "/" .. filename
    local stat = uv.fs_stat(candidate)
    if stat then
      return candidate
    end
    local parent = dir:match("(.+)/[^/]+$")
    if parent == dir then break end
    dir = parent
  end
  return nil
end

local function should_format(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  if bufname == "" then return true end

  if find_in_ancestors(".noformat", bufname) then
    return false
  end

  return true
end

return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = formatters,
      format_on_save = function(bufnr)
        if should_format(bufnr) then
          return { timeout_ms = 500, lsp_fallback = true }
        else
          return nil
        end
      end,
      init = function()
        -- formatexpr is used by vim when formatting code blocks usigg gq
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      end,
    },
  },
}
