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
      pu = "sh ~/nix/modules/apps/home/zsh/scripts/push.sh";
      ip = "sh ~/nix/modules/apps/home/zsh/scripts/ip.sh";
      rb = "sh ~/nix/modules/apps/home/zsh/scripts/rebuild.sh";
      fr = "sudo systemctl reboot --firmware";
      ser = "ssh root@joygnu.org";
      up = "sudo nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
      dn = "dotnet new console";
      dr = "dotnet run";
    };

    history.size = 1000000;
    history.path = ".config/zsh/history";
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
