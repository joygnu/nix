{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set-option -g status off
    '';
  };
}
