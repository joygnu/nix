{modulesPath, ...}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../modules
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
