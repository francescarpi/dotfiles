---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "sans 9"

theme.bg_normal     = "#000000a6"
theme.bg_focus      = "#535d6ca6"
theme.bg_urgent     = "#ff0000a6"
theme.bg_minimize   = "#000000a6"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- Display the taglist squares
theme.taglist_squares_sel   = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/titlebar/maximized_focus_active.png"

theme.wallpaper = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/background"

-- You can use your own layout icons like this:
theme.layout_fairh = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/fairh.png"
theme.layout_fairv = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/fairv.png"
theme.layout_floating  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/floating.png"
theme.layout_magnifier = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/magnifier.png"
theme.layout_max = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/max.png"
theme.layout_fullscreen = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/fullscreen.png"
theme.layout_tilebottom = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/tilebottom.png"
theme.layout_tileleft   = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/tileleft.png"
theme.layout_tile = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/tile.png"
theme.layout_tiletop = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/tiletop.png"
theme.layout_spiral  = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/spiral.png"
theme.layout_dwindle = os.getenv("HOME") .. "/.dotfiles/awesome/themes/default/layouts/dwindle.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
