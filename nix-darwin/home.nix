{ config, pkgs, ... }:

{
  # Specify the macOS username.
  home.username = "shuheieda";
  home.homeDirectory = "/Users/shuheieda";
  # Set the Home Manager state version. Adjust this value according to your Home Manager version.
  home.stateVersion = "23.11";
  
  # Define user-specific packages to be installed.
  home.packages = with pkgs; [
    bat
    htop
    slack
    cowsay
    oh-my-zsh
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
      kns = "kuben";
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "z" "git" "kubectl" "kubectx" "sudo" "dirhistory"];
    theme = "agnoster";
  };
}