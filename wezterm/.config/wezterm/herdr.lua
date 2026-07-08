local wezterm = require("wezterm")
local herdr_bin = "/opt/homebrew/bin/herdr"

local M = {}

M.activate_pane = function(direction)
  wezterm.background_child_process({
    herdr_bin,
    "pane",
    "focus",
    "--direction",
    direction,
    "--current",
  })
end

M.resize_pane = function(direction)
  wezterm.background_child_process({
    herdr_bin,
    "pane",
    "resize",
    "--direction",
    direction,
    "--amount",
    ".01",
    "--current",
  })
end

M.toggle_zoom_pane = function()
  wezterm.background_child_process({
    herdr_bin,
    "pane",
    "zoom",
    "--toggle",
    "--current",
  })
end

M.split_pane = function(type)
  wezterm.background_child_process({
    herdr_bin,
    "pane",
    "split",
    "--direction",
    type,
    "--current",
    "--focus",
  })
end

M.current_workspace = function()
  local _, stdout = wezterm.run_child_process({ herdr_bin, "workspace", "list" })

  if not stdout or stdout == "" then
    return nil
  end

  local ok, data = pcall(wezterm.json_parse, stdout)
  if not ok or not data or not data.result or not data.result.workspaces then
    return nil
  end

  for _, item in ipairs(data.result.workspaces) do
    if item.focused then
      return item
    end
  end

  return nil
end

M.tabs = function(workspace_id)
  local _, stdout = wezterm.run_child_process({ herdr_bin, "tab", "list", "--workspace", workspace_id })
  if not stdout or stdout == "" then
    return nil
  end

  local ok, data = pcall(wezterm.json_parse, stdout)
  if not ok or not data or not data.result or not data.result.tabs then
    return nil
  end

  return data.result.tabs
end

M.activate_tab = function(direction)
  local workspace = M.current_workspace()
  if not workspace then
    return
  end

  local tabs = M.tabs(workspace.workspace_id)
  if not tabs then
    return
  end

  local total = #tabs
  local focused_index = nil

  for i, item in ipairs(tabs) do
    if item.focused then
      focused_index = i
      break
    end
  end

  if not focused_index then
    return
  end

  local new_index
  if direction == "next" then
    new_index = (focused_index % total) + 1
  elseif direction == "previous" then
    new_index = ((focused_index - 2) % total) + 1
  else
    return
  end

  local target = tabs[new_index]
  wezterm.background_child_process({
    herdr_bin,
    "tab",
    "focus",
    target.tab_id,
  })
end

M.new_tab = function()
  wezterm.background_child_process({
    herdr_bin,
    "tab",
    "create",
    "--focus",
  })
end

M.activate_workspace = function(direction)
  local _, stdout = wezterm.run_child_process({ herdr_bin, "workspace", "list" })
  if not stdout or stdout == "" then
    return nil
  end

  local ok, data = pcall(wezterm.json_parse, stdout)
  if not ok or not data or not data.result or not data.result.workspaces then
    return nil
  end

  local total = #data.result.workspaces
  local focused_index = nil

  for i, item in ipairs(data.result.workspaces) do
    if item.focused then
      focused_index = i
      break
    end
  end

  local new_index
  if direction == "next" then
    new_index = (focused_index % total) + 1
  elseif direction == "previous" then
    new_index = ((focused_index - 2) % total) + 1
  else
    return
  end

  local target = data.result.workspaces[new_index]
  wezterm.background_child_process({
    herdr_bin,
    "workspace",
    "focus",
    target.workspace_id,
  })
end

return M
