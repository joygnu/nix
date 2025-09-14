{
  networking.networkmanager.enable = true;

  services.vnstat.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
