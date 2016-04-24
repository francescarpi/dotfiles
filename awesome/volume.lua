local wibox = require("wibox")
local awful = require("awful")

local icon = wibox.widget.imagebox()
local text = wibox.widget.textbox()
local space = wibox.widget.textbox(" ")

volume_widget = wibox.layout.fixed.horizontal()
volume_widget:add(space)
volume_widget:add(icon)
volume_widget:add(text)

function update_volume()
    local fd = io.popen("amixer sget Master")
    local status = fd:read("*all")
    fd:close()

    local onoff = string.match(status, "%[(o[^%]]*)%]")
    local value = tonumber(string.match(status, "(%d?%d?%d)%%"))


    if string.find(onoff, "on", 1, true) then
        text:set_text(" " .. value .. "% ")
        if value >= 0 and value <= 25 then
            icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/audio-volume-low.png")
        elseif value > 25 and value <= 75 then
            icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/audio-volume-medium.png")
        elseif value> 75 then
            icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/audio-volume-high.png")
        end
    else
        icon:set_image(os.getenv("HOME") .. "/.dotfiles/awesome/icons/audio-volume-muted.png")
        text:set_text(" 0% ")
    end

end

volume_widget:buttons(awful.util.table.join(

    -- botó dret, toggle
    awful.button({}, 3, function ()
        awful.util.spawn("amixer set Master toggle")
        update_volume()
    end),

    awful.button({}, 1, function ()
        update_volume()
    end),

    -- mouse wheel. inc/dec volum
    awful.button({ }, 4, function()
        awful.util.spawn('amixer set Master 1%+')
        update_volume()
    end),

    awful.button({ }, 5, function()
        awful.util.spawn('amixer set Master 1%-')
        update_volume()
    end)

))

update_volume()

