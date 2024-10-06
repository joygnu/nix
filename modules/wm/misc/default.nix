{pkgs, ...}: {
  home-manager.users.joy = {
    home.packages = with pkgs; [
      hyprpicker
      playerctl
      rofimoji
      pwvucontrol
    ];
  };
}
