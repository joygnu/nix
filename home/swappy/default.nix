{...}:{
  home.file.".config/swappy".directories = {
    mode = "0755";
  };

  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=$HOME/media/pic/screen
  '';
}

