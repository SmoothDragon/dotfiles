#!/usr/bin/env python3

import subprocess

# Only execute if I am logged in
command = 'who'
result = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
stdout, stderr = result.communicate()
if b'tdraper' not in stdout:
    exit(0)

# Find out what display port I am using
command = 'ls /tmp/.X11-unix'
result = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
stdout, stderr = result.communicate()
lines = stdout.split()
port = int(lines[1][1:])  # filename X127 -> 127

command = f'env DISPLAY=:{port} /usr/bin/gnome-session-quit'
command = f'DISPLAY=:{port} /usr/bin/gnome-session-quit'
print(command)
result = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
stdout, stderr = result.communicate()
lines = stdout.split()
print(lines)
print(port)
# print(stdout)
# print(stderr)
