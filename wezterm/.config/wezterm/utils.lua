local M = {}

M.PATTERNS = {
	herdr = "herdr",
	tuios = "tuios",
	vim = "n?vim",
}

M.backend_of = function(pane)
	local fg = pane:get_foreground_process_name()
	for name, pattern in pairs(M.PATTERNS) do
		if fg:find(pattern) then
			return name
		end
	end

	return "wezterm"
end

M.is_vim = function(pane)
	return M.backend_of(pane) == "vim"
end

M.is_herdr = function(pane)
	return M.backend_of(pane) == "herdr"
end

M.is_tuios = function(pane)
	return M.backend_of(pane) == "tuios"
end

return M
