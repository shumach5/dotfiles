{ config, pkgs, ... }:

{
  # Specify the macOS username.
  home.username = "shuheieda";
  # Specify the home directory for the user.
  home.homeDirectory = "/Users/shuheieda";

  # Enable zsh as the user's shell.
  programs.zsh.enable = true;

  # Define user-specific packages to be installed.
  home.packages = with pkgs; [
    bat
    htop
    starship
  ];

  # Optionally, enable the starship prompt.
  programs.starship.enable = true;

  # Set the Home Manager state version. Adjust this value according to your Home Manager version.
  home.stateVersion = "23.11";
}