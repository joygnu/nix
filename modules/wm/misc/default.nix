{pkgs, ...}: {
  home-manager.users.joy = {
    home.packages = with pkgs; [
      pwvucontrol
      grim
      slurp
      hyprpicker
      swappy
      playerctl
    ];
  };
}
