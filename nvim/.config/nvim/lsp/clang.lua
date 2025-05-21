return {
  cmd = { "clangd" },
  filetypes = { "c" },
  single_file_support = true,
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
    ".git",
  },
}
