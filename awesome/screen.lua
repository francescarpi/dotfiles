local wibox = require("wibox")
local awful = require("awful")

local icon = wibox.widget.imagebox()
icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/video-display.png")

local text = wibox.widget.textbox()
local space = wibox.widget.textbox(" ")

screen_widget = wibox.layout.fixed.horizontal()
screen_widget:add(space)
screen_widget:add(icon)
screen_widget:add(text)

function update_screen()
    local fd = io.popen("xbacklight -get")
    local percent = tonumber(fd:read("*all"))
    fd:close()

    text:set_text(" " .. string.format("%.0f", percent) .. "% ")
end

update_screen()

screen_widget:buttons(awful.util.table.join(

    awful.button({ }, 5, function ()
        awful.util.spawn("xbacklight -dec 10")
        update_screen()
    end),

    awful.button({ }, 4, function ()
        awful.util.spawn("xbacklight -inc 10")
        update_screen()
    end)

))

globalkeys = awful.util.table.join(globalkeys, awful.key({}, "XF86MonBrightnessDown", function() awful.util.spawn("xbacklight -dec 10") update_screen() end))
globalkeys = awful.util.table.join(globalkeys, awful.key({}, "XF86MonBrightnessUp", function() awful.util.spawn("xbacklight -inc 10") update_screen() end))
