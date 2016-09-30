#!/bin/bash

# Install proprietary nvidia driver in Settings 

TERMINAL="direnv tmux vim zsh"
DOCS="kdiff3-doc zsh-doc"
PYTHON="ipython python-bottle python-daemon python-future python-numpy python-requests python-pip python-setuptools"
PYTHON3="ipython3 python3-bottle python3-daemon python3-future python3-numpy python3-requests python3-pip python3-setuptools"
PROG="git gitk kdiff3"
SERVER="openssh-server"
USER="chromium-browser gedit pidgin"

sudo apt install ${TERMINAL} ${DOCS} ${PYTHON} ${PYTHON3} ${PROG} ${SERVER} ${USER}

# Manual setup
# Sign into gmail
# Set up pidgin
#   Protocol: XMPP
#   Username: tom
#   Domain: jabber.betterservers.com
#   Local alias: tom
