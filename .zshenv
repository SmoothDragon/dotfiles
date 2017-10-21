export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Load pyenv automatically
if (( $+commands[pyenv] )) ; then
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
fi
