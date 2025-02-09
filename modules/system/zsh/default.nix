{
  pkgs,
  username,
  domain,
  nixpath,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    histSize = 10000;
    histFile = "$HOME/.config/.zsh_history";

    shellAliases = {
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      sens = "${pkgs.lm_sensors}/bin/sensors";
      cat = "${pkgs.bat}/bin/bat";
      lg = "${pkgs.lazygit}/bin/lazygit";
      sp = "${pkgs.ncdu}/bin/ncdu";
      peg = "${pkgs.ffmpeg}/bin/ffmpeg";
      tmp = "${pkgs.lm_sensors}/bin/sensors";
      ms = "z ~ && ssh ${username}@mail.${domain}";
      hs = "z ~ && ssh ${username}@${domain}";
      fr = "doas systemctl reboot --firmware";
      up = "nix flake update --flake ${nixpath}";
      del = "doas nix-collect-garbage -d";
    };

    ohMyZsh = {
      enable = true;
      plugins = ["git" "history-substring-search"];
      theme = "simple";
    };
  };
}
