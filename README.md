Get different python module working for a directory:
  pyenv install -l    # list all available versions
  pyenv install 3.6.1 # Current available version
  Add line to .envrc:
    use python 3.6.1
  pip3 install virtualenv # Seems to be necessary before next step
  pip3 install ipython3   # Get ipython to be same version
