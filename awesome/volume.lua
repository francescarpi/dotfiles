local wibox     = require("wibox")
local awful     = require("awful")
local gfs       = require("gears.filesystem")
local cfg_path  = gfs.get_configuration_dir()
local beautiful = require("beautiful")
local gears     = require("gears")

local icon = wibox.widget.imagebox()
local text = wibox.widget.textbox()

volume_widget = wibox.layout {
    layout = wibox.layout.fixed.horizontal,
    {
        widget = wibox.container.margin,
        top = 5,
        {
            widget = icon,
            forced_width = 12
        }
    },
    {
        widget = wibox.container.margin,
        right = 10,
        {
            widget = text,
            font = beautiful.font
        }
    }
}

function update_volume()
    -- Instalar: pacman -S alsa-utils pulseaudio-alsa
    local fd = io.popen("amixer sget Master")
    local status = fd:read("*all")
    fd:close()

    local onoff = string.match(status, "%[(o[^%]]*)%]")
    local value = tonumber(string.match(status, "(%d?%d?%d)%%"))


    if string.find(onoff, "on", 1, true) then
        text:set_text(" " .. value .. "% ")
        if value >= 0 and value <= 25 then
            icon:set_image(cfg_path.."icons/audio-volume-low.png")
        elseif value > 25 and value <= 75 then
            icon:set_image(cfg_path.."icons/audio-volume-medium.png")
        elseif value> 75 then
            icon:set_image(cfg_path.."icons/audio-volume-high.png")
        end
    else
        icon:set_image(cfg_path.."icons/audio-volume-muted.png")
        text:set_text(" 0% ")
    end

end

volume_widget:buttons(awful.util.table.join(

    -- botó dret, toggle
    awful.button({}, 3, function ()
        awful.util.spawn("amixer set Master toggle")
        update_volume()
    end),

    -- botó del mitj, actualitza text 
    awful.button({}, 2, function ()
        update_volume()
    end),

    -- botó esquerra, obre pavucontrol
    awful.button({}, 1, function ()
        awful.util.spawn('pavucontrol')
    end),

    -- mouse wheel. inc/dec volum
    awful.button({ }, 4, function()
        awful.util.spawn('amixer set Master 5%+')
        update_volume()
    end),

    awful.button({ }, 5, function()
        awful.util.spawn('amixer set Master 5%-')
        update_volume()
    end)

))

update_volume()

globalkeys = gears.table.join(globalkeys, awful.key({}, "XF86AudioMute", function() awful.util.spawn("amixer set Master toggle") update_volume() end))
globalkeys = gears.table.join(globalkeys, awful.key({}, "XF86AudioRaiseVolume", function() awful.util.spawn("amixer set Master 5%+") update_volume() end))
globalkeys = gears.table.join(globalkeys, awful.key({}, "XF86AudioLowerVolume", function() awful.util.spawn("amixer set Master 5%-") update_volume() end))
