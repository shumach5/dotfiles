#!/usr/bin/env bash

brew bundle cleanup --file ~/dotfiles/Brewfile
brew bundle --file ~/dotfiles/Brewfile

# For https://github.com/junegunn/fzf.vim
$(brew --prefix)/opt/fzf/install
