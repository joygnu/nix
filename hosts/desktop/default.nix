{...}: {
  networking.hostName = "desktop";
  services.hardware.openrgb.enable = true;
  hardware.amdgpu.opencl.enable = true;

  imports = [
    ../../modules
    ./hardware.nix
    ../../modules/apps/gui/games
  ];
}
