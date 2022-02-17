#!/bin/bash

if [ `whoami` != root ]; then
      echo Please run this script as root or using sudo
          exit
fi

sudo apt remove -y conda
sudo rm -f /etc/apt/sources.list.d/conda.list
sudo rm -f /usr/share/keyrings/conda-archive-keyring.gpg
sudo rm -rf /opt/conda
sudo apt update
echo "rm -rf ~/.conda to remove user specific conda files"
