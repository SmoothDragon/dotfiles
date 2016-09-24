#!/bin/bash

# Install proprietary nvidia driver in Settings 

TERMINAL="direnv tmux vim zsh"
DOCS="zsh-doc"
PYTHON="python-requests"
PYTHON3="python34"
# PROG="git gitk"
# SERVER="openssh-server"
# USER="chromium-browser pidgin"

sudo yum install ${TERMINAL} ${DOCS} ${PYTHON} ${PYTHON3} ${PROG} ${SERVER} ${USER}

# Manual setup
# Sign into gmail
# Set up pidgin
#   Protocol: XMPP
#   Username: tom
#   Domain: jabber.betterservers.com
#   Local alias: tom
