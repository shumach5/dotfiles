#!/usr/bin/env bash

pushd ~

case $(uname -s) in
Darwin)
  # -- Homebrew
  ~/dotfiles/brew.sh
  ;;
Linux)
  ~/dotfiles/ubuntu.sh
  ;;
esac

# ----------------------
# nvim plugin support  
# ----------------------
mkdir -p ~/.config
pushd ~/.config
ln -s ~/dotfiles/.vim nvim
popd

# vim fugitive https://github.com/tpope/vim-fugitive#installation
# Use for "Git blame"
mkdir -p ~/.config/nvim/pack/tpope/start
pushd ~/.config/nvim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q
popd

# vim gitgutter https://github.com/airblade/vim-gitgutter
# Show git diff while editing 
mkdir -p ~/.config/nvim/pack/airblade/start
pushd ~/.config/nvim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
nvim -u NONE -c "helptags vim-gitgutter/doc" -c q
popd

# vim commentary https://github.com/tpope/vim-commentary
# Add comment out 
mkdir -p ~/.config/nvim/pack/tpope/start
pushd ~/.config/nvim/pack/tpope/start
git clone https://tpope.io/vim/commentary.git
vim -u NONE -c "helptags commentary/doc" -c q
popd

# ----------------------
# Install python3 
# ----------------------
pip3 install --upgrade pip

# necessary for coc-vim 
# once you install coc vim, you should type `CocInstall coc-pyright` on nvim
# As of 2021 coc-python is deprecated
# https://github.com/fannheyward/coc-pyright
pip3 install pylint jedi

# ----------------------
# Set symlink for tmux  
# ----------------------
ln -s dotfiles/.tmux.conf .tmux.conf

# ----------------------
# Oh my zsh pluginx
# ----------------------

#Need this setting to let zsh plugin install under ~/dotfiles/.oh-my-zsh, 
ZSH_CUSTOM=~/dotfiles/.oh-my-zsh

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
# Syntax completion for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# powerlevel10k
# https://github.com/romkatv/powerlevel10k#oh-my-zsh
# Zsh Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

popd
