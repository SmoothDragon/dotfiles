#!/bin/bash

# Install proprietary nvidia driver in Settings 

TERMINAL="direnv mmv moreutils tmux vim virtualenv virtualenvwrapper zsh"
TYPESCRIPT="enscript pdftk rst2pdf sphinx-common texlive-full"
DOCS="kdiff3-doc sqlite3-doc zsh-doc"
GRAPHIC="inkscape"
PYTHON="ipython python-bottle python-coverage python-daemon python-eventlet python-flask python-future python-jsonschema python-matplotlib python-nine python-numpy python-pandas python-requests python-pip python-scipy python-setuptools python-tk"
PYTHON3="ipython3 python3-bottle python3-coverage python3-daemon python3-eventlet python3-flask python3-future python3-gevent python3-jsonschema python3-matplotlib python3-nine python3-numpy python3-pandas python3-pika python3-requests python3-pip python3-setuptools python3-tk"
PROG="git gitk kdiff3 sqlite3 tox"
SERVER="iperf openssh-server openvpn rabbitmq-server"
DATABASE="sqlitebrowser libsqlite3-dev"
USER="chromium-browser eog gedit pidgin"

sudo apt install ${TERMINAL} ${TYPESCRIPT} ${DOCS} ${PYTHON} ${PYTHON3} ${PROG} ${SERVER} ${USER} ${GRAPHIC} ${DATABASE}

# Manual setup
# Sign into gmail
# Set up pidgin
#   Protocol: XMPP
#   Username: tom
#   Domain: jabber.betterservers.com
#   Local alias: tom
