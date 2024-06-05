{ pkgs, config, ...}:

{
  environment.systemPackages = with pkgs; [
    emulationstation-de
    retroarchFull
    dolphin-emu
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
  ];
}
