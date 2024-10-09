{
  programs.cmus = {
    enable = true;
    extraConfig = ''
      colorscheme gruvbox
    '';
    theme = {
      name = "gruvbox";
      content = ''
        set color_win_fg=default
        set color_win_bg=default
        set color_cmdline_bg=default
        set color_cmdline_fg=default
        set color_error=124
        set color_info=172
        set color_separator=246
        set color_statusline_bg=237
        set color_statusline_fg=72
        set color_titleline_bg=236
        set color_titleline_fg=142
        set color_win_title_bg=246
        set color_win_title_fg=235
        set color_win_cur=175
        set color_win_cur_sel_bg=237
        set color_win_cur_sel_fg=175
        set color_win_inactive_cur_sel_bg=236
        set color_win_inactive_cur_sel_fg=175
        set color_win_sel_bg=237
        set color_win_sel_fg=229
        set color_win_inactive_sel_bg=236
        set color_win_inactive_sel_fg=229
        set color_win_dir=229
      '';
    };
  };
}
