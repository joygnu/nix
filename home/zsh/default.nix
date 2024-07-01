{ config, pkgs, ...} :

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      v = "nvim";
      pu = "git push -u origin main && git push -u origin berg && git push -u hub";
      fr = "sudo systemctl reboot --firmware";
      ser = "ssh root@joygnu.org";
      sp = "sudo nixos-rebuild switch --flake ~/nix/#pc";
      sl = "sudo nixos-rebuild switch --flake ~/nix/#laptop";
      up = "sudo nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
      gtk = "nvim ~/nix/home/gtk/default.nix";
      hy = "nvim ~/nix/home/hyprland/default.nix";
      zs = "nvim ~/nix/home/zsh/default.nix";
      ec = "nvim ~/nix/hosts/pc/default.nix";
      el = "nvim ~/nix/hosts/laptop/default.nix";
      ef = "nvim ~/nix/flake.nix";
      ep = "nvim ~/nix/hosts/pc/default.nix";
      eh = "nvim ~/nix/home/default.nix";
      em = "nvim ~/nix/modules/misc/default.nix";
      es = "nvim ~/nix/modules/stylix/default.nix";
      epa = "vim ~/nix/modules/packages/default.nix";
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

