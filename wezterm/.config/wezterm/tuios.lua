local wezterm = require("wezterm")
local backend = require("backend")

local M = {}

local tuios_bin = "/opt/homebrew/bin/tuios"
local previous_workspace = nil

M.query = function(args)
	local cmd = { tuios_bin }
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

M.run = function(args)
	local cmd = { tuios_bin }
	for _, arg in ipairs(args) do
		table.insert(cmd, arg)
	end
	wezterm.background_child_process(cmd)
end

M.get_current_workspace = function()
	local data = M.query({ "list-workspaces", "--json" })
	if not data then
		return nil
	end

	return data.current_workspace
end

M.get_focused_window = function()
	local data = M.query({ "list-workspaces", "--json" })
	if not data or not data.workspaces then
		return nil
	end

	for _, workspace in ipairs(data.workspaces) do
		if workspace.current and workspace.focused_window_id ~= "" then
			return workspace.focused_window_id
		end
	end

	return nil
end

M.split_window = function(direction)
	local focused = M.get_focused_window()
	local args = { "split-window", direction }
	if focused then
		table.insert(args, "-w")
		table.insert(args, focused)
	end

	M.run(args)
end

M.rotate_layout = function()
	local sessions = M.get_sessions()
	if not sessions then
		return
	end

	local current = M.get_current_session(sessions)
	if not current then
		return
	end

	M.run({ "call", "set-layout", '{"session":"' .. current .. '","rotate":true}' })
end

M.select_workspace = function(num, opts)
	local allow_toggle = opts == nil or opts.allow_toggle ~= false
	local current = M.get_current_workspace()
	local target = num

	if allow_toggle and current == num and previous_workspace ~= nil and previous_workspace ~= num then
		target = previous_workspace
	end

	previous_workspace = current

	M.run({ "select-workspace", tostring(target) })
end

M.activate_workspace = function(direction)
	local current = M.get_current_workspace()
	if not current then
		return
	end

	local next
	if direction == "next" then
		next = (current % 9) + 1
	else
		next = ((current - 2) % 9) + 1
	end

	M.select_workspace(next, { allow_toggle = false })
end

M.get_sessions = function()
	return M.query({ "ls", "--json" })
end

M.get_clients = function()
	return M.query({ "list-clients", "--json" })
end

M.get_current_session = function(sessions)
	for _, session in ipairs(sessions) do
		if session.attached then
			return session.name
		end
	end

	return nil
end

M.switch_session = function(name)
	local clients = M.get_clients()
	local client_id = nil
	for _, client in ipairs(clients or {}) do
		if client.session ~= "" then
			client_id = client.client_id
			break
		end
	end

	local args = { "switch-session" }
	if client_id then
		table.insert(args, "--client")
		table.insert(args, client_id)
	end
	table.insert(args, name)

	M.run(args)
end

M.switch_session_relative = function(direction)
	local sessions = M.get_sessions()
	if not sessions or #sessions < 2 then
		return
	end

	local current = M.get_current_session(sessions)
	if not current then
		return
	end

	local index = nil
	for i, session in ipairs(sessions) do
		if session.name == current then
			index = i
			break
		end
	end

	if not index then
		return
	end

	local target
	if direction == "next" then
		target = (index % #sessions) + 1
	else
		target = ((index - 2) % #sessions) + 1
	end

	M.switch_session(sessions[target].name)
end

return M
