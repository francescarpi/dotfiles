local M = {}

M.is_vim = function(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

M.is_herdr = function(pane)
	return pane:get_foreground_process_name():find("herdr") ~= nil
end

return M
