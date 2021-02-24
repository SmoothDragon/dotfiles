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

# /usr/bin/gnome-session-quit
unset DBUS_SESSION_BUS_ADDRESS
env DISPLAY=:${PORT} /usr/bin/gnome-session-quit
