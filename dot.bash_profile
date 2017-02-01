# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export EDITOR=vim

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# START BASH_PROMPT
source $HOME/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
#GIT_PS1_DESCRIBE_STYLE="branch"
#GIT_PS1_SHOWUPSTREAM="auto git"
PROMPT_COMMAND='__git_ps1 "\n\[\033[0;94m\]\t\[\033[0m\] \w " "\n\$ " "{%s}"'
# END BASH_PROMPT
# START LESS
export LESS='-R'
# END LESS
# START COLOR_LS
alias ll='ls -l --color' 2>/dev/null
alias l.='ls -d .* --color' 2>/dev/null
alias ls='ls --color' 2>/dev/null
# END COLOR_LS
# START RBENV
if [ -e "$HOME/.rbenv" ]; then
  # Just because homebrew has to be different, ugh.
  if [ -e "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
  fi
  eval "$(rbenv init -)"
fi
# END RBENV
