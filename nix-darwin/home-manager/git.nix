{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Shuhei Eda";
    userEmail = "shumach5@gmail.com";
    extraConfig = {
      core = {
        excludesfile = "~/.gitignore_global";
        quotepath = false;
      };
      color = {
        ui = "auto";
        diff = {
          commit = "green";
          meta = "yellow";
          frag = "cyan";
          old = "red";
          new = "green";
          whitespace = "red reverse";
        };
      };
      push = {
        default = "simple";
      };
      github = {
        user = "shumach5";
      };
      diff = {
        compactionHeuristic = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
    aliases = {
      s = "status";
      ci = "commit";
      co = "checkout";
      cp = "cherry-pick";
      br = "branch";
      l = "log";
      lo = "log --oneline";
      lp = "log --patch";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      lga = "log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      a = "add -p";
      pl = "pull";
      ps = "push";
      d = "diff";
      dc = "diff --cached";
      dw = "diff --word-diff=color";
      dcw = "diff --cached --word-diff=color";
      rd = "range-diff";
      g = "grep -n";
      wt = "worktree";
      wta = "worktree add";
      wtl = "worktree list";
      wtr = "worktree remove";
      clean = "clean -fd";
    };
  };

  home.file.".gitignore_global".text = ''
    *.swk
    *.swl
    *.swm
    *.swn
    *.swo
    *.swp
    .DS_Store
    .DS_Store?
    ._*
    .Spotlight-V100
    .Trashes
    .idea
    Icon?
    ehthumbs.db
    Thumbs.db
    node_modules
    *~
    .metals
    .bloop
  '';
} 