#!/usr/bin/env python
# Install:
#  sudo pacman -S python-pip playerctl python-colour python-netifaces python-dbus otf-font-awesome gsimplecal termite xf86-input-synaptics
#  sudo pip install git+https://github.com/enkore/i3pystatus.git fontawesome
# --------------------------------------------------------------------------

import fontawesome as fa

from i3pystatus import Status, get_module
from i3pystatus.core.command import run_through_shell
from i3pystatus.updates import pacman, cower

from subprocess import Popen, PIPE

from touchpad import Touchpad

status = Status(logfile='$HOME/.i3pystatus.log')

# bindsym $mod+Shift+z exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"


status.register(
    'text',
    text=fa.icons['power-off'],
    on_leftclick='i3-nagbar -t warning -m "What do you want to do?" -b "Reboot" "reboot" -b "Shutdown" "shutdown -h now"',
)
status.register(
    'clock',
    format=fa.icons['clock'] + ' %H:%M:%S ' + fa.icons['calendar'] + ' %d',
    color='#C678DD',
    interval=1,
    on_leftclick='/usr/bin/gsimplecal',
)


status.register(
    'network',
    interface='enp3s0',
    color_up='#8AE234',
    color_down='#EF2929',
    format_up=fa.icons['project-diagram'] + ' {interface} {network_graph_recv}{bytes_recv}KB/s',
    format_down=fa.icons['project-diagram'],
)


status.register(
    'network',
    interface='wlp4s0',
    color_up='#8AE234',
    color_down='#EF2929',
    format_up=fa.icons['wifi'] + ' {interface} {network_graph_recv}{bytes_recv}KB/s',
    format_down=fa.icons['wifi'],
)


status.register(
    'backlight',
    interval=5,
    format=fa.icons['sun'] + ' {percentage:.0f}%',
    backlight='intel_backlight',
)


status.register(
    'battery',
    battery_ident='BAT0',
    interval=5,
    format=' {status} {percentage:.0f}%',
    alert=True,
    alert_percentage=15,
    color='#FFFFFF',
    critical_color='#FF1919',
    charging_color='#E5E500',
    full_color='#D19A66',
    status={
        'DIS': fa.icons['battery-quarter'],
        'CHR': fa.icons['battery-half'],
        'FULL': fa.icons['battery-full'],
    },
)

status.register(
    'temp',
    format=fa.icons['thermometer-full'] + ' {temp} °C',
    color='#78EAF2',
)

status.register(
    'mem',
    color='#999999',
    warn_color='#E5E500',
    alert_color='#FF1919',
    format=fa.icons['microchip'] + ' {avail_mem}/{total_mem} GB',
    divisor=1073741824,
)

status.register(
    'disk',
    color='#56B6C2',
    path='/home',
    on_leftclick='nautilus',
    format=fa.icons['home'] + ' {avail} GB',
)


status.register(
    'keyboard_locks',
    format=fa.icons['keyboard'] + ' {caps}',
    caps_on='Caps Lock',
    caps_off='',
    color='#e60053',
)


status.register(
   'spotify',
   format=fa.icons['spotify'] + ' {title} {status}',
   format_no_player=fa.icons['spotify'] + ' Not running',
)

status.register(
    'cpu_usage',
    on_leftclick='termite --title=htop -e \'htop\'',
    format=fa.icons['heartbeat'] + ' {usage}%',
)


status.register(
    Touchpad,
    format=fa.icons['mouse-pointer'] + ' {status}',
    yesno=fa.icons['times'] + ',' + fa.icons['check'],
)


status.register(
    'pulseaudio',
    color_unmuted='#98C379',
    color_muted='#E06C75',
    format_muted=fa.icons['volume-up'] + ' [muted]',
    format=fa.icons['volume-up'] + ' {volume}%',
)

status.run()
