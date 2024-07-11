#!/bin/bash

# debug
# set -x

# Make sure I am logged in
NAMES=`who`
if [[ $NAMES != *"tdraper"* ]]; then
  exit 0;
fi

# Find DISPLAY port
FILENAME=`ls /tmp/.X11-unix | tail -1`
PORT=${FILENAME:1}

PID=$(pgrep gnome-session | tail -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
# /usr/bin/gnome-session-quit
# unset DBUS_SESSION_BUS_ADDRESS
env DISPLAY=:0 /usr/bin/gnome-session-quit
# env DISPLAY=:${PORT} /usr/bin/gnome-session-quit
