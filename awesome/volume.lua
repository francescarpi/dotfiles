local wibox = require("wibox")
local awful = require("awful")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()

   local volume = tonumber(string.match(status, "(%d?%d?%d)%%"))
   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       volume = " <span color='white' background='green'> V: " .. volume .. "% </span>"
   else
       volume = " <span color='white' background='red'> V: M </span>"
   end
   widget:set_markup(volume)
end

update_volume(volume_widget)

