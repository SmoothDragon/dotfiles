#!/usr/bin/env python3

''' Script to set keyboard shortcuts in a Gnome session.

If script fails to connect to dconf server, try running this first:
    export $(dbus-launch)
'''

import subprocess
import sys

shortcuts = [
    {
        'name': 'Lock screen',
        'command': 'xdg-screensaver lock',
        'binding': '<Super><Alt>l',
    },
    {
        'name': 'logout',
        # 'command': 'killall -u `whoami`',
        'command': 'gnome-session-quit --logout --no-prompt',
        'binding': '<Super><Alt>q',
    },
    {
        'name': 'Terminal',
        'command': 'gnome-terminal --zoom=1.5 --geometry=120x80+2800+1400',
        'binding': '<Super><Alt>t',
    },
    {
        'name': 'Big Terminal',
        'command': 'gnome-terminal --maximize',
        'binding': '<Ctrl><Alt>t',
    },
    {
        'name': 'Google Chrome',
        'command': '/n/common/google-chrome/curr/google-chrome',
        'binding': '<Super><Alt>z',
    },
    {
        'name': 'Thunderbird',
        'command': '/usr/local/bin/thunderbird',
        'binding': '<Super><Alt>m',
    },
]

def execute_command(cmd):
    subprocess.call(["/bin/bash", "-c", cmd])

def bindkey(index, description):
    command = 'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom{index}/ {key} "{value}"'
    for key,value in description.items():
        cmd = command.format(**locals())
        # print(cmd)
        execute_command(cmd)

def register_keys(num_keys):
    item = '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom{index}/'
    bindings = [item.format(**locals()) for index in range(num_keys)]
    command = 'gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "{bindings}"'
    cmd = command.format(**locals())
    # print(cmd)
    execute_command(cmd)

if __name__ == '__main__':
    for ii, description in enumerate(shortcuts):
        bindkey(ii, description)
    register_keys(len(shortcuts))

