{pkgs}: let
  link = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v3.1/gruvbox-plus-icon-pack-3.1.zip";
in
  pkgs.stdenv.mkDerivation {
    name = "gruvbox-plus";

    src = pkgs.fetchurl {
      url = link;
      sha256 = "sha256-i/AzhYz/ACeXsG5j0kDVfvfA4TwxA3KZJTPwCO4BKmc=";
    };

    nativeBuildInputs = [pkgs.unzip];

    unpackPhase = ''
      ${pkgs.unzip}/bin/unzip $src -d $out
    '';

    installPhase = ''
      find $out -type l -exec bash -c 'ln -sf "$(readlink -f "$1")" "$1"' _ {} \;
    '';

    dontFixup = true;
  }
