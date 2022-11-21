# Load common config for bash and zsh
source ~/dotfiles/common.sh

export plugins=(
  git
  yarn
  fzf
  z 
  zsh-autosuggestions
  web-search
  kubectl
  sudo
  dirhistory 
  history
  nvm
)

# Clean up and reload zsh config including completion
# https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#completion-issues
alias reload_zsh="rm -f ~/.zcompdump* && omz reload"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# integrate fzf with z command
# https://github.com/junegunn/fzf/wiki/Examples#integration-with-z
# https://github.com/ohmyzsh/ohmyzsh/issues/11282 (Replacing _z with zshz is needed)
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && zshz "$*" && return
  cd "$(zshz -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
