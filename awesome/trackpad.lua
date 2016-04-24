local wibox = require("wibox")
local awful = require("awful")

local icon = wibox.widget.imagebox()
local text = wibox.widget.textbox()
local space = wibox.widget.textbox(" ")

icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/input-touchpad.png")

trackpad_widget = wibox.layout.fixed.horizontal()
trackpad_widget:add(space)
trackpad_widget:add(icon)
trackpad_widget:add(text)

function update_trackpad()
    local fd = io.popen("synclient -l | grep TapButton1")
    local status = fd:read("*all")
    fd:close()

    local value = tonumber(string.match(status, "= (%d)"))
    if value == 0 then
        text:set_text(" OFF ")
    else
        text:set_text(" ON ")
    end
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

update_trackpad()

