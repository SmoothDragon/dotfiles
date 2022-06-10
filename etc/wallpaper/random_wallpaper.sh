#!/bin/bash

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDVI-D-0/workspace0/last-image -s `ls /home/tom/dotfiles/etc/wallpaper/*.jpg | sort -R | head -1`
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-A-0/workspace0/last-image -s `ls /home/tom/dotfiles/etc/wallpaper/*.jpg | sort -R | head -1`
