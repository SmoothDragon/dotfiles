# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.localbashrc ]; then
        . ~/.localbashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/opt/bin

export PATH
