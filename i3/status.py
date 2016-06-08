#!/usr/bin/env python
# encoding: utf-8
# vim:ft=python.django:
# --------------------------------------------------------------------------

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock", format="%d/%m/%Y %H:%M",)
status.register("load")
status.register("pulseaudio", format="AUDIO: {volume}% {muted}",)
status.register("battery", format=("{status}/{consumption:.2f}W {percentage:.2f}% "
                "[{percentage_design:.2f}%] {remaining:%E%hh:%Mm}"),
                path="/sys/class/power_supply/BAT0/uevent",
                alert=True, alert_percentage=5, status={"DIS": "↓", "CHR": "↑", "FULL": "=",})

status.register("network", interface="wlp4s0",
                format_up="{essid} {quality:.0f}%",)

status.register("backlight", format="BRILLO: {percentage:.0f}%",
                backlight="intel_backlight")
status.run()
