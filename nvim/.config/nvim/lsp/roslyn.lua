return {
  cmd = {
    "roslyn-language-server",
    "--stdio",
  },
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "openFiles",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },
  },
  filetypes = { "cs" },
  root_dir = function(fname)
    local p = vim.fn.fnamemodify(fname, ":h")
    local results = vim.fs.find({ "*.sln", "*.csproj", "global.json" }, { upward = true, path = p })
    if #results > 0 then
      return vim.fs.dirname(results[1])
    end
  end,
  single_file_support = true,
}
