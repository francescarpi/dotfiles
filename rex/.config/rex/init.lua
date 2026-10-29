rex.mode("resize", { exclusive = true })
rex.bind("cmd+r", "client.mode.enter", { name = "resize" })

rex.bind("resize/h", "pane.resize", { direction = "left" })
rex.bind("resize/l", "pane.resize", { direction = "right" })
rex.bind("resize/k", "pane.resize", { direction = "up" })
rex.bind("resize/j", "pane.resize", { direction = "down" })

rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")

rex.bind("cmd+l", "pane.focus.right")
rex.bind("cmd+h", "pane.focus.left")
rex.bind("cmd+k", "pane.focus.up")
rex.bind("cmd+j", "pane.focus.down")

rex.bind("cmd+z", "pane.zoom")

rex.bind("cmd+n", "client.tab.next")
rex.bind("cmd+p", "client.tab.previous")

rex.bind("cmd+shift+n", "session.next")
rex.bind("cmd+shift+p", "session.previous")

rex.bind("cmd+enter", "client.palette.toggle")

-- cmd+1..cmd+9 jump to a tab by number. Pressing the same number again while
-- already on that tab goes back to the tab you came from.
--
-- previous_tab remembers the window to return to, per session. It only tracks
-- jumps made through these bindings, so switching tabs another way (mouse,
-- cmd+n/cmd+p) leaves it pointing at an older tab.
local previous_tab = {}

rex.action({
	name = "tab_goto",
	title = "Go to Tab",
	description = "Go to a tab by number, or back to the previous tab when already there",
	category = "Tabs",
	keywords = "tab goto switch jump index number",
	args = { index = "integer" },
	run = function(ctx, args)
		local view, err = rex.session.view({})
		if err ~= nil then
			error(err, 0)
		end

		local windows = view.windows or {}
		local active = view.active_window_id

		-- Which tab is showing now (1-based, the same order the tabs are in).
		local current_index
		for i, window in ipairs(windows) do
			if window.window_id == active then
				current_index = i
				break
			end
		end

		local target = windows[args.index]
		if target == nil then
			return { ok = false, reason = "no tab " .. args.index }
		end

		if current_index == args.index then
			-- Already on that tab: go back to the one we came from, if it's still
			-- open.
			local previous = previous_tab[ctx.session_id]
			if previous ~= nil then
				for _, window in ipairs(windows) do
					if window.window_id == previous then
						target = window
						previous_tab[ctx.session_id] = nil
						break
					end
				end
			end
		elseif active ~= nil then
			-- Coming from another tab: remember this one.
			previous_tab[ctx.session_id] = active
		end

		rex.client.queue("session.select", {
			session_id = ctx.session_id,
			window_id = target.window_id,
		})

		return { window_id = target.window_id }
	end,
})

for i = 1, 9 do
	rex.bind("cmd+" .. i, "tab_goto", { index = i })
end
