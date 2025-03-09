{
  pkgs,
  username,
  ...
}: let
  cmus-tmux = pkgs.writeScriptBin "cmus-tmux" ''
    if ${pkgs.tmux}/bin/tmux has-session -t ${pkgs.cmus}/bin/cmus 2>/dev/null; then
        foot -e ${pkgs.tmux}/bin/tmux attach-session -t ${pkgs.cmus}/bin/cmus
    else
        ${pkgs.tmux}/bin/tmux new-session -d -s cmus cmus
        ${pkgs.foot}/bin/foot  -e tmux attach-session -t cmus
    fi
  '';
in {
  environment.systemPackages = [cmus-tmux];
  home-manager.users.${username} = {
    programs.tmux = {
      enable = true;
      extraConfig = ''
        set-option -g status off
        # Ensure tmux uses 256 colors
        set -g default-terminal "tmux-256color"

        # Enable true colors (24-bit color) in tmux
        set-option -ga terminal-overrides ",xterm-256color:Tc"
      '';
    };
  };
}
