{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    zulu17
    dolphin-emu
    lutris-free
  ];
}
