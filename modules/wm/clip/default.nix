{pkgs, ...}: {
  home-manager.users.joy = {
    home.packages = with pkgs; [
      wl-clipboard
    ];

    services.cliphist.enable = true;
  };
}
