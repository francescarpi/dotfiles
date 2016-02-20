local wibox = require("wibox")
local awful = require("awful")

trackpad_widget = wibox.widget.textbox()
trackpad_widget:set_align("right")

function update_trackpad(widget)
   local fd = io.popen("synclient -l | grep TapButton1")
   local status = fd:read("*all")
   fd:close()

   local value = tonumber(string.match(status, "= (%d)"))
   if value == 0 then
     output = " <span> TP: OFF </span> | "
   else
     output = " <span> TP: ON </span> | "
   end
   widget:set_markup(output)
end

function trackpad_toggle()
   local fd = io.popen("synclient -l | grep TapButton1")
   local status = fd:read("*all")
   fd:close()
   local value = tonumber(string.match(status, "= (%d)"))
   if value == 0 then
    awful.util.spawn("synclient TapButton1=1")
   else
    awful.util.spawn("synclient TapButton1=0")
   end
end

trackpad_widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function ()
        trackpad_toggle()
        update_trackpad(trackpad_widget)
    end)
))

update_trackpad(trackpad_widget)

