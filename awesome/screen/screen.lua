local wibox     = require("wibox")
local awful     = require("awful")
local gfs       = require("gears.filesystem")
local cfg_path  = gfs.get_configuration_dir()
local beautiful = require("beautiful")

local text = wibox.widget.textbox()

screen_widget = wibox.layout {
    layout = wibox.layout.fixed.horizontal,
    {
        widget = wibox.container.margin,
        top = 4,
        left = 10,
        {
            widget = wibox.widget.imagebox,
            image = cfg_path .. "screen/video-display.png",
            forced_width = 14
        }
    },
    {
        widget = wibox.container.margin,
        left = 2,
        {
            widget = text,
            font = beautiful.font
        }
    }
}

local function get_bright()
    os.execute("sleep .2")
    local fd = io.popen("xbacklight -get")
    local percent = tonumber(fd:read("*all"))
    fd:close()
    percent = string.format("%.0f", percent)
    return percent
end

local function update_screen()
    text:set_text(" " .. get_bright() .. "% ")
end

local function brightness_toggle()
    percent = get_bright()

    if percent == "100" then
        awful.util.spawn("xbacklight -set 15")
    elseif percent == "15" then
        awful.util.spawn("xbacklight -set 30")
    elseif percent == "30" then
        awful.util.spawn("xbacklight -set 50")
    elseif percent == "50" then
        awful.util.spawn("xbacklight -set 75")
    else
        awful.util.spawn("xbacklight -set 100")
    end
end

update_screen()

screen_widget:buttons(awful.util.table.join(

    awful.button({ }, 1, function ()
        brightness_toggle()
        update_screen()
    end),

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