#!/usr/bin/env python
# encoding: utf-8
# vim:ft=python.django:
# --------------------------------------------------------------------------

from i3pystatus import Status, get_module
from i3pystatus.core.command import run_through_shell

from subprocess import Popen, PIPE

status = Status(standalone=True)

# main clock
status.register("clock", format="%d/%m/%Y %H:%M",)

# load average
status.register("load")

# audio
status.register("pulseaudio", format="AUDIO: {volume}% {muted}",)

# battery
status.register(
    "battery",
    format=("{status} [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}"),
    path="/sys/class/power_supply/BAT0/uevent",
    alert=False,
    alert_percentage=10,
    status={"DIS": "↓", "CHR": "↑", "FULL": "="}
)

# network
status.register("network", interface="wlp4s0",
                format_up="{essid} {quality:.0f}%",)


# backlight
@get_module
def change_brightness(self):
    process = Popen(["xbacklight"], stdout=PIPE)
    output, error = process.communicate()
    process.wait()
    current = round(float(output[:-1]))

    if current == 100.0:
        setback = 15
    elif current == 15.0:
        setback = 30
    elif current == 30.0:
        setback = 50
    else:
        setback = 100

    run_through_shell(["xbacklight", "-set", str(setback)])

status.register(
    "backlight",
    format="BRILLO: {percentage:.0f}%",
    backlight="intel_backlight",
    on_leftclick=[change_brightness]
)

status.run()
