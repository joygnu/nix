{
  networking.hostName = "desktop";
  services.hardware.openrgb.enable = true;
  hardware.amdgpu.opencl.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
    ../../modules/games
  ];
}
