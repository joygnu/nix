{pkgs, ...}: let
  cmus-tmux = pkgs.writeScriptBin "cmus-tmux" ''
    if ${pkgs.tmux}/bin/tmux has-session -t ${pkgs.cmus}/bin/cmus 2>/dev/null; then
        foot -e ${pkgs.tmux}/bin/tmux attach-session -t ${pkgs.cmus}/bin/cmus
    else
        tmux new-session -d -s cmus cmus
        foot  -e tmux attach-session -t cmus
    fi
  '';
in {
  environment.systemPackages = [cmus-tmux];
}
