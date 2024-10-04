{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    zulu17
    dolphin-emu
    mangohud
    lutris-free
  ];
}
