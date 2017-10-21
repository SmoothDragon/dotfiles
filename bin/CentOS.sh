#!/bin/bash

# Install proprietary nvidia driver in Settings 
# Repos to install:
# epel elrepo nux google-chrome

# DOCS=""
# PYTHON="python-daemon"
PYTHON="tk-devel python-virtualenv"
PYTHON2 = "ipython"
# PYTHON2="ipython numpy python-bottle python2-eventlet python-future python-pandas python-pip python-requests python-setuptools"
PYTHON3="python34"
# PYTHON3="python34 python34-bottle python34-numpy python34-pip python34-requests python34-setuptools"
PROG="git gitk golang ruby"
# SERVER="openssh-server"
DESKTOP="pidgin"
TERMINAL="htop tmux unison vim zsh"
TEX="texlive-latex"
# TEX="texlive-xetex-bin texlive-collection-xetex"
UTILITY="bzip2 bzip2-devel openssl-devel readline-devel sqlite sqlite-devel xz xz-devel zlib-devel"

sudo yum update
sudo yum install ${TERMINAL} ${DOCS} ${PYTHON} ${PYTHON2} ${PYTHON3} ${PROG} ${SERVER} ${DESKTOP} ${TEX} ${UTILITY}

# Manual setup
# Sign into gmail
# Set up pidgin
#   Protocol: XMPP
#   Username: tom
#   Domain: jabber.betterservers.com
#   Local alias: tom

# RPMs:
# wget https://bin.equinox.io/c/4Jbv9XAvTAU/direnv-stable-linux-amd64.rpm

# General CentOs advice:
# http://xed.ch/h/centos.html
# TODO: Use above to start VNC connection
