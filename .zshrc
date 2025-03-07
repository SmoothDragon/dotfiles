# Local settings {{{

# Primary group user is in
GROUP=`id -g -n`

# {print $2} recovers local address name (e.g. san.rr.com)
# {print $1} separates on . to get most specific name (e.g. san)
LOCATION=`grep search /etc/resolv.conf | awk '{print $2}' | awk -F . '{print $1}'`

# zsh setup specific to a group or location
[[ -f ~/.zshrc.$GROUP ]] && . ~/.zshrc.$GROUP
[[ -f ~/.zshrc.$LOCATION ]] && . ~/.zshrc.$LOCATION
[[ -f ~/.zshrc.$HOSTNAME ]] && . ~/.zshrc.$HOSTNAME

echo "Group: $GROUP    Location: $LOCATION  Hostname: $HOSTNAME"

# }}}
# Global settings {{{
umask 027 ## Others can't w my files
# }}}    
# Environment {{{
# Hostnames
export HOSTALIASES=~/.ssh/hosts
# Export
export ZSH_THEME="3den"
export HISTSIZE=65536
export HISTFILESIZE=1048576
export HISTFILE="$HOME/.zhistory"
export SAVEHIST=$HISTSIZE
#export TERM=vt100
export PATH=~/dotfiles/bin:~/bin:~/local/bin:~/.local/bin:~/opt/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin
export PATH=~/.cargo/bin:$PATH  # Rust
export PATH=$PATH:~/.npm-global/bin  # Javascript
export PATH=$PATH:~/go/bin  # Go
export PATH=$PATH:~/.cabal/bin  # Haskell
export PATH=$PATH:/usr/brlcad/bin  # BRL-CAD
#export CDPATH=.:~:.. ## on cd command offer dirs in home and one dir up

# Programming    {{{
export CARGO_TARGET_DIR=~/.cargo
export CPATH=~/include:~/local/include: # additional include directories
export LIBRARY_PATH=~/lib:~/local/lib: # additional library directories
export TEXINPUTS=~/lib/tex//: # // searches subdirectories : includes defaults
export EDITOR=vim
export GOPATH=$HOME/go
# }}}
#Zsh options`date +%Y%m%d_%H%M%S` {{{
autoload -U compinit
compinit
    
autoload -U promptinit
promptinit
#prompt adam2    
    
autoload -U colors
colors

# Version control info. Put ${vcs_info_msg_0_} somewhere in your $PS1.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git bzr svn

# zsh options    
setopt COMPLETE_IN_WORD # tab complete in the middle of a word
setopt AUTO_PUSHD
setopt NO_BEEP # never ever beep ever
unsetopt BEEP
    
# share history between zsh processes    
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# other history stuff
setopt ALL_EXPORT
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY
    
# zstyle completion options
setopt COMPLETEALIASES
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' group-name ''    

zstyle ':completion::complete:prusa-slicer:*' ignored-patterns '^(*.(stl|step))'
zstyle ':completion::complete:evince:*' ignored-patterns '^(*.pdf)'
zstyle ':completion::complete:openscad:*' ignored-patterns '^(*.scad)'
zstyle ':completion::complete:openscad-nightly:*' file-patterns '
  *(D-/):local-directories:"local directory" 
  *.(scad)(D-^/):media-files:"media file"
'
# }}}
# Alias {{{
#unalias -a # Remove all previous aliases
alias ducks='du -cks -- * | sort -rn | head -11'
alias dud="du -s -- * | sort -n | cut -f 2- | while read a; do du -hs |$a|; done"
alias ND='ls -ld *(/om[1])' # Show newest directory
alias NF='ls *(.om[1])'     # print newest file (not directory)
alias OF='ls *(om[1])'      # print oldest file
alias ls='ls --color=auto'
alias lsp='ls --color | less -R'
alias la='ls -al --color=auto'
alias lap='ls -al --color | less -R'
alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
alias gitlog='git log --pretty=oneline'
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias top='top -c'

function newest() { ls -lt **/*(D.om[1,${1:-30}]) ;}  # Optional arg default 30
function oldest() { ls -lt **/*(D.Om[1,${1:-30}]) ;}  # Optional arg default 30

# }}}
# Discipline Aliases {{{
alias which='echo "Try: type -a"'
alias more='echo "Try: less"'

# Functions
backup() { cp $1 $1.`date +%Y%m%d_%H%M%S`; } # Make timestamped backup 
    

# Suffix alias - run exec on files ending with suffix
alias -s html=w3m
alias -s dvi=xdvi
alias -s pdf=acroread    

alias gitk='gitk --all'
# If vimx exists and vim is not compiled with +xterm_clipboard, use vimx.
[[ -e /usr/bin/vimx ]] && /usr/bin/vim --version | grep -q -- -xterm_clipboard && alias vim='/usr/bin/vimx'
# }}}
# Key binding {{{
# Use vi-mode in ZSH
# bindkey -v

# bindkey '' up-history
# bindkey '' down-history
# bindkey '' backward-delete-char
# bindkey '' backward-delete-char
# bindkey '' backward-kill-word
# bindkey '' history-incremental-search-backward

# Map alternate escape key to 'jj'
# bindkey -M viins 'jj' vi-cmd-mode
# }}}
# Git prompt {{{
setopt prompt_subst
function __prompt_git()
{
        local git_dir ref br top;
        git_dir=$(git rev-parse --git-dir 2> /dev/null) || return
        ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        br=${ref#refs/heads/}
        top=$(cat $git_dir/patches/$br/current 2>/dev/null) \
                  && top="/$top"
                  echo "[$br$top]"
}
export PS1='[%?]%{$fg[green]%}%n%{$reset_color%}@%m:%~\$ '
export RPS1='%{$fg[yellow]%}$(__prompt_git) %{$reset_color%}%D{%Y%m%d-%H:%M:%S}'
# #export RPS1='%{$fg[yellow]%}${vcs_info_msg_0_} %{$reset_color%}%*'
# if [[ "$USER" == "root" ]] ; then
        # export PS1='[%?]%{$fg[red]%}%n%{$reset_color%}@%m:%~# '
# fi

# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
# use Unicode 2B2E for vertival oval
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}⬮%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}⬮%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}⬮%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
# git_prompt_string() {
  # local git_where="$(parse_git_branch)"
  # [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
# }

# Set the right-hand prompt
# RPS1='$(git_prompt_string)'

# }}}    

# Hook for direnv
if type "direnv" &> /dev/null; then
  eval "$(direnv hook zsh)"
  # Recommended to wrap tmux to avoid issues with environment loading
  alias tmux='direnv exec / tmux'
fi

# Local options {{{
if [ -f ~/.zshrc.local ];
then
  . ~/.zshrc.local
fi
# }}}


# Unused {{{
#export PATH=${SAGE_PATH}/local/bin:$PATH
    
#compctl -/g '*.{^(?:[^a]|a(?!ux))*$}' emacs
#compctl -/g '*.(tex|aux)' emacs
#compctl -/g '*.^(aux|dvi|lof|log|lot|blg|bbl|ps|pdf|toc)*' emacs # Don't complete certain file types
# compctl -/g '*.pdf' + -/g '*(-/)' kpdf xpdf
# compctl -/g '*.dvi' + -/g '*(-/)' kdvi xdvi
    
# my zsh functions    
#export FPATH=~/share/zsh/functions:$FPATH
#autoload -U ~/share/zsh/functions/*(:t)

# reload zsh functions
# r() {
  # local f
  # f=(~/share/zsh/function/*(.))
  # unfunction $f:t 2> /dev/null
  # autoload -U $f:t
# }

# }}}

# show_virtual_env() {
  # if [ -n "$VIRTUAL_ENV" ]; then
    # echo "($(basename $VIRTUAL_ENV))"
  # fi
# }

# pyenv is deprecating their prompt mangling
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# PS1='$(show_virtual_env)'$PS1
#

# Only executes if new shell is in a TMUX session
# if (( ${+TMUX} )); then
  # .tmux_envrc should set environment variables for all interactive shells
  # if [[ -a .tmux_envrc ]]; then
    # echo "Activitating local .tmux_envrc"
    # source .tmux_envrc
  # fi
# fi


# Only executes if new shell is in a TMUX session
if (( ${+TMUX} )); then
  # .tmux_envrc should set environment variables for all interactive shells
  file_name=".tmux_envrc"
  current_dir="."

  while true; do
    if [ -e "$current_dir/$file_name" ]; then
      echo "Activitating local .tmux_envrc"
      source "$current_dir/$file_name"
      break
    fi

    if [[ "$current_dir" == "/" ]]; then
      echo "File '$file_name' not found in parent directories."
      break
    fi

    current_dir="../$current_dir"
  done
fi

