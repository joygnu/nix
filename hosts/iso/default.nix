{modulesPath, ...}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../modules/system
    ../../modules/programs
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
