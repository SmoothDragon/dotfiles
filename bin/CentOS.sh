#!/bin/bash

# Install proprietary nvidia driver in Settings 

TERMINAL="direnv tmux vim zsh"
DOCS="zsh-doc"
PYTHON="python-daemon"
PYTHON2="ipython numpy python-bottle python2-eventlet python-future python-pandas python-pip python-requests python-setuptools"
PYTHON3="python34 python34-bottle python34-numpy python34-pip python34-requests python34-setuptools"
PROG="git gitk golang ruby"
# SERVER="openssh-server"
# USER="chromium-browser pidgin"

sudo yum install ${TERMINAL} ${DOCS} ${PYTHON} ${PYTHON2} ${PYTHON3} ${PROG} ${SERVER} ${USER}

# Manual setup
# Sign into gmail
# Set up pidgin
#   Protocol: XMPP
#   Username: tom
#   Domain: jabber.betterservers.com
#   Local alias: tom

# RPMs:
# wget https://bin.equinox.io/c/4Jbv9XAvTAU/direnv-stable-linux-amd64.rpm
