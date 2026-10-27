local wezterm = require("wezterm")

local M = {}

M.BINS = {
	herdr = "/opt/homebrew/bin/herdr",
	tuios = "/opt/homebrew/bin/tuios",
}

M.AMOUNTS = {
	herdr = ".01",
	tuios = ".05",
}

M.run = function(backend, args)
	local cmd = { M.BINS[backend] }
	for _, arg in ipairs(args) do
		table.insert(cmd, arg)
	end
	wezterm.background_child_process(cmd)
end

M.query = function(backend, args)
	local cmd = { M.BINS[backend] }
	for _, arg in ipairs(args) do
		table.insert(cmd, arg)
	end

	local _, stdout = wezterm.run_child_process(cmd)
	if not stdout or stdout == "" then
		return nil
	end

	local ok, data = pcall(wezterm.json_parse, stdout)
	if not ok or not data then
		return nil
	end

	return data
end

M.pane_focus = function(backend, direction)
	M.run(backend, { "pane", "focus", "--direction", direction })
end

M.pane_resize = function(backend, direction)
	M.run(backend, {
		"pane",
		"resize",
		"--direction",
		direction,
		"--amount",
		M.AMOUNTS[backend],
	})
end

M.pane_zoom = function(backend)
	M.run(backend, { "pane", "zoom", "--toggle" })
end

M.pane_split = function(backend, direction)
	M.run(backend, { "pane", "split", "--direction", direction, "--focus" })
end

M.pane_swap = function(backend, direction)
	M.run(backend, { "pane", "swap", "--direction", direction })
end

M.panes = function(backend, workspace_id)
	local args = { "pane", "list" }
	if workspace_id then
		table.insert(args, "--workspace")
		table.insert(args, workspace_id)
	end

	local data = M.query(backend, args)
	if not data or not data.result or not data.result.panes then
		return nil
	end

	return data.result.panes
end

M.focused_pane = function(backend, workspace_id)
	local panes = M.panes(backend, workspace_id)
	if not panes then
		return nil
	end

	for _, pane in ipairs(panes) do
		if pane.focused then
			return pane
		end
	end

	return nil
end

M.focus_pane_by_id = function(backend, pane_id)
	M.run(backend, { "pane", "focus", pane_id })
end

M.workspaces = function(backend)
	local data = M.query(backend, { "workspace", "list" })
	if not data or not data.result or not data.result.workspaces then
		return nil
	end

	return data.result.workspaces
end

M.focus_workspace_by_id = function(backend, workspace_id)
	M.run(backend, { "workspace", "focus", workspace_id })
end

M.tabs = function(backend, workspace_id)
	local args = { "tab", "list" }
	if workspace_id then
		table.insert(args, "--workspace")
		table.insert(args, workspace_id)
	end

	local data = M.query(backend, args)
	if not data or not data.result or not data.result.tabs then
		return nil
	end

	return data.result.tabs
end

M.focus_tab_by_id = function(backend, tab_id)
	M.run(backend, { "tab", "focus", tab_id })
end

M.create_tab = function(backend)
	M.run(backend, { "tab", "create", "--focus" })
end

M.relative_index = function(items, direction)
	local total = #items
	local index = nil

	for i, item in ipairs(items) do
		if item.focused then
			index = i
			break
		end
	end

	if not index then
		return nil
	end

	if direction == "next" then
		return (index % total) + 1
	end

	return ((index - 2) % total) + 1
end

M.activate_workspace_by_index = function(backend, index)
	local workspaces = M.workspaces(backend)
	if not workspaces then
		return
	end

	local target = workspaces[index]
	if not target then
		return
	end

	M.focus_workspace_by_id(backend, target.workspace_id)
end

M.activate_workspace = function(backend, direction)
	local workspaces = M.workspaces(backend)
	if not workspaces then
		return
	end

	local index = M.relative_index(workspaces, direction)
	if not index then
		return
	end

	M.focus_workspace_by_id(backend, workspaces[index].workspace_id)
end

M.activate_tab = function(backend, direction)
	local workspace = M.focused_pane(backend)
	if not workspace then
		return
	end

	local tabs = M.tabs(backend, workspace.workspace_id)
	if not tabs then
		return
	end

	local index = M.relative_index(tabs, direction)
	if not index then
		return
	end

	M.focus_tab_by_id(backend, tabs[index].tab_id)
end

M.get_tab_by_index = function(backend, index)
	local workspace = M.focused_pane(backend)
	if not workspace then
		return nil
	end

	local tabs = M.tabs(backend, workspace.workspace_id)
	if not tabs then
		return nil
	end

	return tabs[index]
end

return M
