local home_dir = os.getenv("HOME")
local node_version = "16.16.0"
local node_bin = home_dir .. "/.nvm/versions/node/v" .. node_version .. "/bin"

if not vim.loop.fs_stat(node_bin .. "/node") then
  error("Node version '" .. node_version .. "' is not present. Please, installe it.")
else
  -- vim.g.node_host_prog = node_bin .. "/node"
  vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")
end
