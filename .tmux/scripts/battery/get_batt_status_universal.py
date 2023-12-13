#!/usr/bin/env python
# encoding: utf-8

import platform
from subprocess import check_output

AC_EMOJI = u'🔌'
BATT_EMOJI = u'🔋'

def get_osx_battery_percent():
    output = check_output(["pmset", "-g", "batt"]).decode('ascii')
    lines = output.splitlines()

    emoji = AC_EMOJI if "'AC Power'" in lines[0] else BATT_EMOJI

    percent = lines[1].split('\t')[1].split(';')[0]

    return '%s %s' % (percent, emoji)


def get_linux_battery_percent():
    percent = '?'
    ac_online = True
    with open('/sys/class/power_supply/BAT0/capacity') as f:
        percent = f.read().strip()
    with open('/sys/class/power_supply/AC/online') as a:
        ac_online = a.read().strip() == '1'

    # emoji = AC_EMOJI if ac_online else BATT_EMOJI
    emoji = 'AC' if ac_online else 'BAT'

    return '%s %s' % (percent, emoji)


def on_osx():
    return platform.system() == 'Darwin'


def on_linux():
    return platform.system() == 'Linux'

if __name__ == '__main__':
    if on_osx():
        print(get_osx_battery_percent())
    elif on_linux():
        print(get_linux_battery_percent())
    else:
        print("??% ⍰")

