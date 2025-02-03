{pkgs, ...}: let
  cmus-tmux = pkgs.writeScriptBin "cmus-tmux" ''
    if tmux has-session -t cmus 2>/dev/null; then
        foot -e tmux attach-session -t cmus
    else
        tmux new-session -d -s cmus cmus
        foot  -e tmux attach-session -t cmus
    fi
  '';
in {
  environment.systemPackages = [cmus-tmux];
}
