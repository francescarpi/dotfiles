
local theme_assets          = require("beautiful.theme_assets")
local xresources            = require("beautiful.xresources")
local dpi                   = xresources.apply_dpi
local gears                 = require("gears")

local gfs                   = require("gears.filesystem")
local themes_path           = gfs.get_configuration_dir()

local theme                 = {}

theme.font                  = "Verdana Bold 10"

theme.bg_normal             = "#000000"
theme.bg_focus              = "#546e7a"
theme.bg_urgent             = "#d50000"
theme.bg_minimize           = theme.bg_normal
theme.bg_systray            = theme.bg_normal

theme.fg_normal             = "#828282"
theme.fg_focus              = "#ffffff"
theme.fg_urgent             = "#ffffff"
theme.fg_minimize           = "#505050"

theme.useless_gap           = 5
theme.border_width          = dpi(3)
theme.border_normal         = theme.bg_normal
theme.border_focus          = theme.bg_urgent
theme.border_marked         = "#91231c"

theme.menu_submenu_icon     = themes_path.."default/submenu.png"
theme.menu_height           = dpi(15)
theme.menu_width            = dpi(100)

-- theme.wallpaper             = themes_path.."default/background.jpg"

theme.layout_fairh          = themes_path.."default/layouts/fairh.png"
theme.layout_fairv          = themes_path.."default/layouts/fairv.png"
theme.layout_floating       = themes_path.."default/layouts/floating.png"
theme.layout_magnifier      = themes_path.."default/layouts/magnifier.png"
theme.layout_max            = themes_path.."default/layouts/max.png"
theme.layout_fullscreen     = themes_path.."default/layouts/fullscreen.png"
theme.layout_tilebottom     = themes_path.."default/layouts/tilebottom.png"
theme.layout_tileleft       = themes_path.."default/layouts/tileleft.png"
theme.layout_tile           = themes_path.."default/layouts/tile.png"
theme.layout_tiletop        = themes_path.."default/layouts/tiletop.png"
theme.layout_spiral         = themes_path.."default/layouts/spiral.png"
theme.layout_dwindle        = themes_path.."default/layouts/dwindle.png"
theme.layout_cornernw       = themes_path.."default/layouts/cornernw.png"
theme.layout_cornerne       = themes_path.."default/layouts/cornerne.png"
theme.layout_cornersw       = themes_path.."default/layouts/cornersw.png"
theme.layout_cornerse       = themes_path.."default/layouts/cornerse.png"

theme.awesome_icon          = theme_assets.awesome_icon(
    theme.menu_height,
    theme.bg_normal,
    theme.fg_normal
)

-- theme.tasklist_disable_icon = true
theme.tasklist_font         = "Verdana 8"

local taglist_square_size   = dpi(4)
theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
    taglist_square_size,
    theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size,
    theme.fg_normal
)

-- Naughty
theme.naughty_icon_size = 22
-- TODO : Fix this external call
local naughty = require("naughty")
naughty.config.presets.normal.bg = theme.bg_normal
naughty.config.presets.normal.fg = theme.fg_normal
naughty.config.presets.normal.border_color = theme.fg_normal

naughty.config.presets.low.bg = theme.bg_normal
naughty.config.presets.low.fg = theme.fg_normal
naughty.config.presets.low.border_color = theme.bg_normal

naughty.config.presets.critical.bg = theme.bg_urgent
naughty.config.presets.critical.fg = theme.fg_urgent
naughty.config.presets.critical.border_color = theme.fg_urgent

return theme
