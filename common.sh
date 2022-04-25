# Common shell config for bash and zsh

# Colorful ls
export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'

# Colorful grep
# GREP_OPTIONS is deprecated...
alias grep='grep --color=auto'

# Colorful less
export LESS='-R'

# Tell applications that the terminal accepts UTF-8.
# Using only LC_CTYPE as iTerm2 does.
# This enables tmux to output unicode characters.
export LC_CTYPE='UTF-8'

# ------- Aliases -------

# vim
export EDITOR=$(which vim)

# History
export HISTFILE=~/.zsh_history 
export HISTSIZE=100000
export SAVEHIST=100000

# Safety
alias rm='rm -i'
alias mv='mv -i'

# Todo
alias todo='grep -rn --color TODO ./*'

# Find process
alias proc='ps ax | grep'

# Docker
alias d="docker"
alias dm="docker-machine"
alias dc="docker-compose"

# tmux
alias tm="tmux"

# curl
alias curlt="curl -w '@$HOME/dotfiles/curl-format.txt'"

# vim
alias vi=nvim
alias vim=nvim
alias view=nvim -R

# python
alias python=python3

# If you see a locale error when running nvm.
# https://unix.stackexchange.com/questions/259569/change-locale-in-script
export LC_ALL=C.UTF-8

# kubernetes alias
alias kctx=kubectx
alias kns=kubens

# ------- Path -------
export PATH=$HOME/dotfiles/bin:$PATH
