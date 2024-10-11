{
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
}
