{ config, pkgs, ...} :

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "ls -a";
      sp = "sudo nixos-rebuild switch --flake ~/nix/#pc";
      sl = "sudo nixos-rebuild switch --flake ~/nix/#laptop";
      up = "sudo nix flake update ~/nix";
      fr = "sudo systemctl reboot --firmware";
      hy = "vim ~/nix/home/hyprland/default.nix";
      eh = "vim ~/nix/home/default.nix";
      gtk = "vim ~/nix/home/gtk/default.nix";
      v = "vim";
      ser = "ssh root@joygnu.org";
      zs = "vim ~/nix/home/zsh/default.nix";
      epa = "vim ~/nix/modules/packages/default.nix";
      del = "sudo nix-collect-garbage -d";
      push = "git push origin main && git push berg main";
      ec = "vim ~/nix/hosts/pc/default.nix";
      el = "vim ~/nix/hosts/laptop/default.nix";
      ef = "vim ~/nix/flake.nix";
      ep = "vim ~/nix/hosts/pc/default.nix";
      em = "vim ~/nix/modules/misc/default.nix";
      es = "vim ~/nix/modules/stylix/default.nix";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "history-substring-search" ];
      theme = "simple";
    };
  };
}

