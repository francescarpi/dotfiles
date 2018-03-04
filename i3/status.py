#!/usr/bin/env python
# encoding: utf-8
# --------------------------------------------------------------------------

from i3pystatus import Status, get_module
from i3pystatus.core.command import run_through_shell
from i3pystatus.updates import pacman, cower

from subprocess import Popen, PIPE

status = Status()


status.register("updates",
    format = "Updates: {count}",
    format_no_updates = "",
    backends = [pacman.Pacman(), cower.Cower()])


status.register("clock",
    format=" %H:%M:%S",
    color='#C678DD',
    interval=1,
    on_leftclick="/usr/bin/gsimplecal",)


status.register("pulseaudio",
    color_unmuted='#98C379',
    color_muted='#E06C75',
    format_muted=' [muted]',
    format=" {volume}%")


status.register("network",
    interface="enp0s25",
    color_up="#8AE234",
    color_down="#EF2929",
    format_up=": {v4cidr}",
    format_down="",)


status.register("network",
    interface="wlp4s0",
    color_up="#8AE234",
    color_down="#EF2929",
    format_up="  {essid}  {kbs} kbs",
    format_down="",)


status.register("backlight",
    interval=5,
    format=" {percentage:.0f}%",
    backlight="intel_backlight",)


status.register("battery",
    battery_ident="BAT0",
    interval=5,
    format="{status} {percentage:.0f}%",
    alert=True,
    alert_percentage=15,
    color="#FFFFFF",
    critical_color="#FF1919",
    charging_color="#E5E500",
    full_color="#D19A66",
    status={
        "DIS": " ",
        "CHR": "  ",
        "FULL": "   ",
},)


status.register("temp",
    color='#78EAF2',
                )

status.register("mem",
    color="#999999",
    warn_color="#E5E500",
    alert_color="#FF1919",
    format=" {avail_mem}/{total_mem} GB",
    divisor=1073741824,)


status.register("disk",
    color='#56B6C2',
    path="/home",
    on_leftclick="pcmanfm",
    format=" {avail} GB",)


status.register("keyboard_locks",
    format='{caps}',
    caps_on='Caps Lock',
    caps_off='',
    color='#e60053',
    )


status.register(
    "spotify",
    format=" {status} {length} {artist} - {title}",
    format_not_running=" Not running"
)


status.register("cpu_usage",
    on_leftclick="termite --title=htop -e 'htop'",
    format=" {usage}%",)


status.register("touchpad",
    format=" {status}",
    yesno=",")

status.run()

