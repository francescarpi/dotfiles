local wibox = require("wibox")
local awful = require("awful")
local gfs = require("gears.filesystem")
local cfg_path = gfs.get_configuration_dir()

local text = wibox.widget.textbox()
local icon = wibox.widget.imagebox()

battery_widget = wibox.layout {
    layout = wibox.layout.fixed.horizontal,
    {
        widget = wibox.container.margin,
        top = 2,
        left = 10,
        {
            widget = icon,
            forced_width = 17
        }
    },
    {
        widget = wibox.container.margin,
        right = 10,
        text
    }
}

awful.widget.watch(
    'acpi', 60,
    function(widget, stdout, stderr, reason, exit_code)
        local percent = tonumber(string.match(stdout, "(%d?%d?%d)%%"))

        text:set_text(" " .. percent .. "% ")

        if percent >= 0 and percent <= 5 then
            icon:set_image(cfg_path.."battery/battery-caution.png")
        elseif percent > 5 and percent <= 10 then
            icon:set_image(cfg_path.."battery/battery-low.png")
        elseif percent > 10 and percent <= 75 then
            icon:set_image(cfg_path.."battery/battery-good.png")
        elseif percent > 75 then
            icon:set_image(cfg_path.."battery/battery-full.png")
        end
    end,
    battery_widget
)