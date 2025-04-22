{
  networking.networkmanager.enable = true;
  networking.nameservers = ["9.9.9.9"];

  services.resolved = {
    enable = true;
    dnssec = "true";
    fallbackDns = ["149.112.112.112"];
    dnsovertls = "true";
  };
}
