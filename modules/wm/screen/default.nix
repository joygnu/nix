{pkgs, ...}: {
  home-manager.users.joy = {
    home.file.".config/swappy/config".text = ''
      [Default]
      save_dir=$HOME/media/pic/screen
    '';

    home.packages = with pkgs; [
      grim
      slurp
      swappy
    ];
  };
}
