{ config, pkgs, ... }:

{
  # Specify the macOS username.
  home.username = "shuheieda";
  home.homeDirectory = "/Users/shuheieda";
  # Define user-specific packages to be installed.
  home.packages = with pkgs; [
    bat
    htop
    slack
    cowsay
    oh-my-zsh
  ];

  home.file = {
    #".zshrc".source = config.lib.file.mkOutOfStoreSymlink "/Users/shuheieda/dotfiles/.zshrc";
  };

  # Enable zsh as the user's shell.
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "z" ];
    theme = "agnoster";
  };

  # Set the Home Manager state version. Adjust this value according to your Home Manager version.
  home.stateVersion = "23.11";

  # Create symlink to custom .zshrc
  # home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "/Users/shuheieda/dotfiles/.zshrc";
}