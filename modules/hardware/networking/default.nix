{
  networking.networkmanager.enable = true;

  services.vnstat.enable = true;

  networking = {
    nameservers = [
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"
    ];

    networkmanager.dns = "none";
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
