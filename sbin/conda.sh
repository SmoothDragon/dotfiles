#!/bin/bash

if [ `whoami` != root ]; then
      echo Please run this script as root or using sudo
          exit
fi

# Install our public GPG key to trusted store
echo ">>> Download and install public GPG key"
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc  | gpg --dearmor | sudo tee /usr/share/keyrings/conda-archive-keyring.gpg > /dev/null
sudo chmod 644 /usr/share/keyrings/conda-archive-keyring.gpg

# Check whether fingerprint is correct (will output an error message otherwise)
echo
echo ">>> Verify keyring fingerprint"
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806

# Add our Debian repo
echo ">>> Add Debian repo"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" | sudo tee /etc/apt/sources.list.d/conda.list
sudo chmod 644 /etc/apt/sources.list.d/conda.list

sudo apt update
sudo apt install conda

# Install github CLI
source /opt/conda/etc/profile.d/conda.sh
conda install gh --channel conda-forge
