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
    enableAutosuggestions = true;
    dotDir = ".config/zsh";
    history.size = 1000000;
    history.path = ".config/zsh/history";

    shellAliases = {
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      v = "${pkgs.helix}/bin/hx";
      cat = "${pkgs.bat}/bin/bat";
      lg = "${pkgs.lazygit}/bin/lazygit";
      ms = "z ~ && ssh ${username}@mail.${domain}";
      hs = "z ~ && ssh ${username}@${domain}";
      fr = "doas systemctl reboot --firmware";
      up = "nix flake update --flake ${nixpath}";
      del = "doas nix-collect-garbage -d";
      rb = "nix-on-droid switch --flake ${nixpath}/#phone";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "history-substring-search"];
      theme = "simple";
    };
  };
}
