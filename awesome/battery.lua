local wibox = require("wibox")
local awful = require("awful")

local icon = wibox.widget.imagebox()
local text = wibox.widget.textbox()
local space = wibox.widget.textbox(" ")

battery_widget = wibox.layout.fixed.horizontal()
battery_widget:add(space)
battery_widget:add(icon)
battery_widget:add(text)


function update_battery()
    local fd = io.popen("acpi")
    local status = fd:read("*all")
    fd:close()

    local percent = tonumber(string.match(status, "(%d?%d?%d)%%"))
    local remaining = string.match(status, ", (%d%d:%d%d)")

    text:set_text(" " .. percent .. "% " .. remaining .. "h ")

    if percent >= 0 and percent <= 5 then
        icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/battery-caution.png")
    elseif percent > 5 and percent <= 10 then
        icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/battery-low.png")
    elseif percent > 10 and percent <= 75 then
        icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/battery-good.png")
    elseif percent > 75 then
        icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/battery-full.png")
    end

end

update_battery()

mytimer = timer({ timeout = 60 })
mytimer:connect_signal("timeout", function () update_battery() end)
mytimer:start()
