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
      v = "hx";
      cat = "bat";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      pu = "bash ~/nix/home/zsh/push.sh";
      fr = "sudo systemctl reboot --firmware";
      ser = "ssh root@joygnu.org";
      rb = "bash ~/nix/home/zsh/desktop-laptop.sh";
      up = "sudo nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
      hy = "hx ~/nix/home/hyprland/default.nix";
      zs = "hx ~/nix/home/zsh/default.nix";
      el = "hx ~/nix/hosts/laptop/default.nix";
      ef = "hx ~/nix/flake.nix";
      ed = "hx ~/nix/hosts/desktop/default.nix";
      eh = "hx ~/nix/home/default.nix";
      em = "hx ~/nix/modules/misc/default.nix";
      es = "hx ~/nix/modules/stylix/default.nix";
      ep = "hx ~/nix/modules/packages/default.nix";
      ex = "hx ~/nix/home/helix/default.nix";
      efox = "hx ~/nix/home/firefox/default.nix";
    };

    history.size = 1000000;
    history.path = ".config/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ 
      "history-substring-search"
      ];
    };

  };
}
