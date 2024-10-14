{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    shellAliases = {
      cn = "cd ~/nix";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      v = "hx";
      cat = "bat";
      lg = "${pkgs.lazygit}/bin/lazygit";
      ser = "ssh root@joygnu.org";
      ip = "sh ~/nix/modules/programs/home/zsh/scripts/ip.sh";
      rb = "sh ~/nix/modules/programs/home/zsh/scripts/rebuild.sh";
      fr = "sudo systemctl reboot --firmware";
      up = "nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
      dn = "dotnet new console";
      dr = "dotnet run";
    };

    history.size = 1000000;
    history.path = ".config/zsh/history";
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "history-substring-search" "autosuggestion"];
      theme = "simple";
    };
  };
}
