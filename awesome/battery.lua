local wibox = require("wibox")
local awful = require("awful")

battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")

function update_battery(widget)
   local fd = io.popen("acpi")
   local status = fd:read("*all")
   fd:close()

   local percent = tonumber(string.match(status, "(%d?%d?%d)%%"))

    if percent <= 10 then
       battery = " <span color='white' background='red'> B: " .. percent .. "% </span>"
    else
       battery = " <span color='white' background='green'> B: " .. percent .. "% </span>"
    end

   widget:set_markup(battery)
end

update_battery(battery_widget)

mytimer = timer({ timeout = 60 })
mytimer:connect_signal("timeout", function () update_battery(battery_widget) end)
mytimer:start()
