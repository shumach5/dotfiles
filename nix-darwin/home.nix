{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "shuheieda";
  home.homeDirectory = "/Users/shuheieda";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Development
    git
    vim
    neovim
    ripgrep
    fd
    fzf
    bat
    exa

    # Docker
    docker
    docker-compose

    # Kubernetes
    kubectl
    kubectx
    kubens

    # Python
    python3
    pipx

    # Node.js
    nodejs
    yarn
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "shuheieda";
    userEmail = "shuheieda@gmail.com";
  };

  # Shell configuration
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "kubectl"
        "python"
        "node"
        "npm"
        "yarn"
        "fzf"
      ];
      theme = "robbyrussell";
    };
  };

  # Neovim configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-surround
      vim-commentary
      vim-fugitive
      vim-airline
      vim-airline-themes
      nerdtree
      fzf-vim
      vim-tmux-navigator
    ];
    extraConfig = ''
      set number
      set expandtab
      set tabstop=2
      set shiftwidth=2
      set smartindent
      set hlsearch
      set incsearch
      set ignorecase
      set smartcase
    '';
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Shell aliases
  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    view = "nvim -R";
    python = "python3";
    kctx = "kubectx";
    kns = "kubens";
    d = "docker";
    dc = "docker-compose";
    tm = "tmux";
  };
} 