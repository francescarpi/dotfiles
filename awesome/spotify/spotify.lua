local wibox = require("wibox")
local awful = require("awful")
local gfs = require("gears.filesystem")
local cfg_path = gfs.get_configuration_dir()

local text = wibox.widget.textbox()

spotify_widget = wibox.layout {
    layout = wibox.layout.fixed.horizontal,
    {
        widget = wibox.container.margin,
        top = 4,
        left = 5,
        {
            widget = wibox.widget.imagebox,
            image = cfg_path .. "spotify/spotify.png",
            forced_width = 13
        }
    },
    {
        widget = wibox.container.margin,
        left = 5,
        right = 10,
        text
    }
}

spotify_widget:buttons(awful.util.table.join(
    awful.button({}, 1, function()
        awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
    end)
))

awful.widget.watch(
    'pidof -s spotify', 1,
    function(widget, stdout, stderr, reason, exit_code)
        if string.len(stdout) > 0 then
            text:set_text("On")
        else
            text:set_text("Off")
        end
    end,
    spotify_widget
)