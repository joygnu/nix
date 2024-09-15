{pkgs, ...}: {
  home-manager.users.joy.programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    dotDir = ".config/zsh";
    initExtra = "PROMPT='%F{green}%~%f '";

    shellAliases = {
      v = "hx";
      cat = "bat";
      cn = "cd ~/nix";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      pu = "sh ~/nix/modules/apps/cli/zsh/scripts/push.sh";
      ip = "sh ~/nix/modules/apps/cli/zsh/scripts/ip.sh";
      fr = "sudo systemctl reboot --firmware";
      ser = "ssh root@joygnu.org";
      rb = "sh ~/nix/modules/apps/cli/zsh/scripts/rebuild.sh";
      up = "sudo nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
    };

    history.size = 1000000;
    history.path = ".config/zsh/history";
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
