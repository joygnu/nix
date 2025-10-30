{
  pkgs,
  domain,
  username,
  nixpath,
  ...
}: {
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  home-manager.users = {
    ${username} = {
      programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        dotDir = "/home/joy/.config/zsh";
        history.size = 1000000;
        history.path = "/home/joy/.config/zsh/history";

        shellAliases = {
          ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
          sp = "${pkgs.ncdu}/bin/ncdu";
          v = "${pkgs.helix}/bin/hx";
          cat = "${pkgs.bat}/bin/bat";
          lg = "${pkgs.lazygit}/bin/lazygit";
          wp = "${pkgs.wakeonlan}/bin/wakeonlan 18:c0:4d:ee:c1:21";
          ms = "z ~ && ssh ${username}@mail.${domain.a}";
          hs = "z ~ && ssh ${username}@${domain.a}";
          fr = "doas systemctl reboot --firmware";
          up = "nix flake update --flake ${nixpath}";
          del = "${pkgs.nh}/bin/nh clean all";
        };

        oh-my-zsh = {
          enable = true;
          plugins = ["git" "history-substring-search"];
          theme = "simple";
        };
      };
    };
  };
}
