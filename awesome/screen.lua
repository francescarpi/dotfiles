local wibox = require("wibox")
local awful = require("awful")

screen_widget = wibox.widget.textbox()
screen_widget:set_align("right")

function update_screen(widget)
   local fd = io.popen("xbacklight -get")
   local percent = tonumber(fd:read("*all"))
   fd:close()

   output = " <span color='white' background='green'> S: " .. string.format("%.0f", percent) .. "% </span>"
   widget:set_markup(output)
end

update_screen(screen_widget)
