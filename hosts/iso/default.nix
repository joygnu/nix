{modulesPath, ...}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../modules/programs/norm/misc
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
