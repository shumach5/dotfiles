{
  description = "Example nix-darwin system flake";

  inputs = {
    # Specify the nixpkgs input using the unstable channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Specify the nix-darwin repository.
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    # Ensure nix-darwin uses the same nixpkgs input.
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    # Specify the home-manager repository.
    home-manager.url = "github:nix-community/home-manager";
    # Ensure home-manager uses the same nixpkgs input.
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    # Define common variables
    username = "shuheieda";
    homeDirectory = "/Users/${username}";

    # Define the base system configuration.
    configuration = { pkgs, ... }: {
      
      # List of packages to install system-wide.
      environment.systemPackages = [
        pkgs.vim
      ];

      # Enable experimental features needed for flakes.
      nix.settings.experimental-features = "nix-command flakes";

      # Define system users
      users.users.${username} = {
        name = username;
        home = homeDirectory;
        shell = pkgs.zsh;
      };

      # ------------------------------
      # Home Manager Integration Settings
      # ------------------------------
      # Allow Home Manager to manage global packages.
      home-manager.useGlobalPkgs = true;
      # Allow Home Manager to manage user-specific packages.
      home-manager.useUserPackages = true;
      # Import the Home Manager configuration from the home.nix file.
      home-manager.users.${username} = { config, pkgs, ... }: import ./home.nix { inherit config pkgs username homeDirectory; };
      # ------------------------------

      # Set the Git commit hash for the darwin configuration revision.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Define the system state version (used for backwards compatibility).
      system.stateVersion = 4;

      # Specify the host platform; here it is set to aarch64-darwin.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Allow the installation of unfree packages.
      nixpkgs.config.allowUnfree = true;

      # Set your machine name explicitly
      networking.hostName = "MacBook-Pro";
      
      ids.gids.nixbld = 350;

      # Homebrew configuration
      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          cleanup = "zap";
        };
        global = {
          brewfile = true;
          lockfiles = false;
        };
        brews = [
          "docker-compose"
          "mas"
        ];
        casks = [
          "docker"
          "dotnet"
          "iterm2"
          "visual-studio-code"
          "obs"
          "audacity"
          "notion"
          "raycast"
          "cursor"
          "1password"
          "microsoft-excel"
          "microsoft-word"
          "microsoft-powerpoint"
          "microsoft-onenote"
        ];
        masApps = {
          "Monosnap" = 540348655;
          "Tailscale" = 1470499037;
        };
      };
    };
  in
  {
    # Define the darwin configuration for the host.
    darwinConfigurations."jinarashi" = nix-darwin.lib.darwinSystem {
      modules = [
        # Apply the base system configuration.
        configuration
        # Integrate Home Manager with nix-darwin.
        home-manager.darwinModules.home-manager
      ];
    };
  };
}