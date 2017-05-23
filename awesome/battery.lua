local wibox     = require("wibox")
local awful     = require("awful")
local gfs       = require("gears.filesystem")
local cfg_path  = gfs.get_configuration_dir()

local text = wibox.widget.textbox()
local icon = wibox.widget.imagebox()

battery_widget = wibox.layout {
    layout = wibox.layout.fixed.horizontal,
    {
        widget = wibox.container.margin,
        top = 3,
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

local function update_battery()
    local fd = io.popen("acpi")
    local status = fd:read("*all")
    fd:close()

    local percent = tonumber(string.match(status, "(%d?%d?%d)%%"))

    text:set_text(" " .. percent .. "% ")

    if percent >= 0 and percent <= 5 then
        icon:set_image(cfg_path.."icons/battery-caution.png")
    elseif percent > 5 and percent <= 10 then
        icon:set_image(cfg_path.."icons/battery-low.png")
    elseif percent > 10 and percent <= 75 then
        icon:set_image(cfg_path.."icons/battery-good.png")
    elseif percent > 75 then
        icon:set_image(cfg_path.."icons/battery-full.png")
    end

end

update_battery()

mytimer = timer({ timeout = 60 })
mytimer:connect_signal("timeout", function () update_battery() end)
mytimer:start()
