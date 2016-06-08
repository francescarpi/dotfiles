#!/usr/bin/env python
# encoding: utf-8
# vim:ft=python.django:
# --------------------------------------------------------------------------

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock", format="%d/%m/%Y %H:%M",)
status.register("load")
status.register("pulseaudio", format="♪{volume}% {muted}",)
status.run()
