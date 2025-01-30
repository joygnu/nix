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
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      v = "${pkgs.helix}/bin/hx";
      cat = "${pkgs.bat}/bin/bat";
      lg = "${pkgs.lazygit}/bin/lazygit";
      ms = "z ~ && ssh joy@45.145.42.193";
      hs = "z ~ && ssh ${username}@${domain}";
      ip = "sh ${nixpath}/modules/programs/zsh/scripts/ip.sh";
      rb = "sh ${nixpath}/modules/programs/zsh/scripts/rebuild.sh";
      fr = "doas systemctl reboot --firmware";
      up = "nix flake update --flake ${nixpath}";
      del = "doas nix-collect-garbage -d";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "history-substring-search"];
      theme = "simple";
    };
  };
}
