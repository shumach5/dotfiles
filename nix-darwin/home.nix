{ config, pkgs, username, homeDirectory, ... }:

{
  # Specify the macOS username.
  home.username = username;
  home.homeDirectory = homeDirectory;
  # Set the Home Manager state version. Adjust this value according to your Home Manager version.
  home.stateVersion = "23.11";
  
  # Define user-specific packages to be installed.
  home.packages = with pkgs; [
    htop
    slack
    discord
    cowsay
    oh-my-zsh
    fzf
    kubectx
    kubectl
    jq
    wget
    neovim
    python3Full
  ];

  # Enable zsh as the user's shell.
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      # Directory navigation
      ".." = "cd .."; 
      
      # Kubernetes shortcuts
      kctx = "kubectx";
      kns = "kubens";
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "z" "git" "kubectl" "kubectx" "sudo" "dirhistory"];
    theme = "agnoster";
  };
}