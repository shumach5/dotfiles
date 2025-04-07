{ config, pkgs, username, homeDirectory, ... }:

{
  # Specify the macOS username.
  home.username = username;
  home.homeDirectory = homeDirectory;
  # Set the Home Manager state version. Adjust this value according to your Home Manager version.
  home.stateVersion = "23.11";
  
  # Import Git configuration
  imports = [ 
    ./home-manager/git.nix
    ./home-manager/zsh.nix
  ];
  
  # Define user-specific packages to be installed.
  home.packages = with pkgs; [
    git
    htop
    slack
    cowsay
    oh-my-zsh
    fzf
    kubectx
    kubectl
    jq
    wget
    neovim
    python3Full
    zsh-fzf-tab
  ];
}