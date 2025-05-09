{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      # Directory navigation
      ".." = "cd .."; 
      
      # Kubernetes shortcuts
      kctx = "kubectx";
      kns = "kubens";

      python = "python3";

      vim = "nvim";

      # Nix shortcuts
      switch = "darwin-rebuild switch --flake ~/dotfiles/nix-darwin#jinarashi";
    };
    initExtra = ''
      # integrate fzf with z command
      # https://github.com/junegunn/fzf/wiki/Examples#integration-with-z
      # https://github.com/ohmyzsh/ohmyzsh/issues/11282 (Replacing _z with zshz is needed)
      unalias z 2> /dev/null
      z() {
        [ $# -gt 0 ] && zshz "$*" && return
        cd "$(zshz -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "''\${*##-*}'" | sed 's/^[0-9,.]* *//')"
      }

      # fbr - checkout git branch
      # https://github.com/junegunn/fzf/wiki/Examples
      fbr() {
        local branches branch
        branches=$(git --no-pager branch -vv) &&
        branch=$(echo "$branches" | fzf +m) &&
        git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
      }

      # source fzf-tab
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      # fzf key bindings for command history search
      source <(fzf --zsh)

      # Enable Starship theme
      eval "$(starship init zsh)"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "z" "git" "kubectl" "kubectx" "sudo" "dirhistory"];
    };
  };
  programs.starship = {
    settings = {
      add_newline = true;
    };
  };
} 