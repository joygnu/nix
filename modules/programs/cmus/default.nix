{
  programs.cmus = {
    enable = true;
    extraConfig = ''
      set color_win_fg=15
      set color_win_bg=0
      set color_win_title_bg=0
      set color_win_title_fg=15
      set color_separator=4
      set color_titleline_bg=0
      set color_titleline_fg=15
      set color_statusline_bg=8
      set color_statusline_fg=15
      set color_cmdline_bg=0
      set color_cmdline_fg=15
      set color_error=167
      set color_info=214
      set color_win_cur=4
      set color_win_cur_sel_bg=8
      set color_win_cur_sel_fg=4
      set color_win_inactive_cur_sel_bg=0
      set color_win_inactive_cur_sel_fg=4
      set color_win_sel_bg=8
      set color_win_sel_fg=15
      set color_win_inactive_sel_bg=0
      set color_win_inactive_sel_fg=15
      set color_win_dir=15
    '';
  };
}