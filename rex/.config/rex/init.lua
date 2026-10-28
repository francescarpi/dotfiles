rex.mode("resize", { exclusive = true })
rex.bind("cmd+r", "client.mode.enter", { name = "resize" })

rex.bind("resize/h", "pane.resize", { direction = "left" })
rex.bind("resize/l", "pane.resize", { direction = "right" })
rex.bind("resize/k", "pane.resize", { direction = "up" })
rex.bind("resize/j", "pane.resize", { direction = "down" })

rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")

rex.bind("cmd+l", "pane.focus.right")
rex.bind("cmd+h", "pane.focus.left")
rex.bind("cmd+k", "pane.focus.up")
rex.bind("cmd+j", "pane.focus.down")

rex.bind("cmd+z", "pane.zoom")
