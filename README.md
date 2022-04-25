# Dotfiles

My personal configurations for Vim, tmux, Git, Winget, etc.  

For Windows: Provides automatic setup for desktop applications. 
For Linux(Ubuntu): provides rich development environment. 
For Mac: Provides rich experience for dev environment in addiiton to automatic setup for desktop appliations.
## Preparation
* Windows: N/A (`winget` is installed by default in case of Windows11 or later)
* Mac: [Homebrew](https://brew.sh/)
* Linux(Ubuntu): N/A

## Installation (For Windows)
Clone this repository to your home directory and run the init script.

```powershell
cd ~
git clone git@github.com:shuhei/dotfiles.git
winget import -i .\dotfiles\winget_import_file.json
```  

### Cookbook
* If you would like to update the software installed by winget, run `winget upgrade --all` [source](https://docs.microsoft.com/en-us/windows/package-manager/winget/upgrade)
* `winget list` shows the list of applications managed by winget

## Installations (For Linux and Mac)
1. Clone the repo and run `init.sh` by the following command.
```shell
cd ~
git clone git@github.com:shuhei/dotfiles.git

./dotfiles/init.sh
```
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) with the following command.
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Replace `~/.zshrc` with the following:

```shell
export ZSH="$HOME/.oh-my-zsh"

# Load before oh-my-zsh.sh because `plugins` are listed in this file.
source ~/dotfiles/.zshrc

# Set a custom directory for the custom prompt
ZSH_CUSTOM=~/dotfiles/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh
```

4. Run `source .zshrc`.  (It should automatically starts powerlevel10k's theme settings)

[Delete completion cache files](https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#i-have-enabled-a-completion-plugin-but-the-completion-doesnt-work) when you add a new completion plugin.

5. At the top of `~/.gitconfig`, add:

```
[include]
  path = ~/dotfiles/.gitconfig
```
### Cookbook
- Reload `.zshrc` including completion: `reload_zsh`
- Fuzzy-find command arguments: `<C-t>` or `**<TAB>` (read [junegunn/fzf](https://github.com/junegunn/fzf) for more)
