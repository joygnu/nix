{  pkgs, ... } :

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    dotDir = ".config/zsh";
    initExtra = "PROMPT='%F{green}%~%f '";
 
    shellAliases = {
      v = "nvim";
      cat = "bat";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      pu = "bash ~/nix/home/zsh/push.sh";
      fr = "sudo systemctl reboot --firmware";
      ser = "ssh root@joygnu.org";
      rb = "bash ~/nix/home/zsh/desktop-laptop.sh";
      up = "sudo nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
      hy = "nvim ~/nix/home/hyprland/default.nix";
      zs = "nvim ~/nix/home/zsh/default.nix";
      el = "nvim ~/nix/hosts/laptop/default.nix";
      ef = "nvim ~/nix/flake.nix";
      ed = "nvim ~/nix/hosts/desktop/default.nix";
      eh = "nvim ~/nix/home/default.nix";
      em = "nvim ~/nix/modules/misc/default.nix";
      es = "nvim ~/nix/modules/stylix/default.nix";
      ep = "nvim ~/nix/modules/packages/default.nix";
      ev = "nvim ~/nix/home/neovim/default.nix";
    };

    history.size = 1000000;
    history.path = "~/.config/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ 
      "history-substring-search"
      "git"
      ];
    };

  };
}

