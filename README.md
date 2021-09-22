# github
# To store personal authentication tokens locally
git config --global credential.helper store

# pyenv

## Install
pyenv - from https://github.com/pyenv/pyenv-installer
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

## Update
pyenv update

## Usage
Get different python module working for a directory:
  pyenv install -l    # list all available versions
  pyenv install 3.6.1 # Current available version
  Add line to .envrc:
    use python 3.6.1
  pip3 install ipython   # Get ipython to be same version

## Uninstall
rm -rf ~/.pyenv

# direnv

## install
Add link so use_python will work:
cd 
ln -s dotfiles/.direnvrc 

## uninstall
rm -rf ~/.pyenv
rm ~/.direnvrc

Remove lines from .bashrc:
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

If complains about not knowing about virtualenv:
  #pip3 install virtualenv # Seems to be necessary before next step


Direnv
git clone into directory
ln -s ~/dotfiles/direnv/vendor/github.com ~/dotfiles/go/src
linkup should link "go" directory in home
