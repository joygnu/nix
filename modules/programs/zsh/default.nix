{
  pkgs,
  domain,
  username,
  nixpath,
  ...
}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";
    history.size = 1000000;
    history.path = ".config/zsh/history";

    shellAliases = {
      cn = "cd ~/nix";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      v = "hx";
      cat = "bat";
      lg = "${pkgs.lazygit}/bin/lazygit";
      rs = "z ~ && ssh root@45.145.42.193";
      hs = "z ~ && ssh ${username}@${domain}";
      su = "z ~ && su";
      ip = "sh ~/${nixpath}modules/programs/zsh/scripts/ip.sh";
      rb = "sh ~/${nixpath}modules/programs/zsh/scripts/ip.sh";
      fr = "doas systemctl reboot --firmware";
      up = "nix flake update --flake ~/${nixpath}";
      del = "doas nix-collect-garbage -d";
      dn = "dotnet new console";
      dr = "dotnet run";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "history-substring-search"];
      theme = "simple";
    };
  };
}
