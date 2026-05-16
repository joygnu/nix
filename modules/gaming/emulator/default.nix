{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    emulator.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.emulator.enable {
    # Add the overlay for openldap fix
    nixpkgs.overlays = [
      (final: prev: {
        openldap =
          if prev.stdenv.hostPlatform.system == "i686-linux"
          then
            prev.openldap.overrideAttrs (oldAttrs: {
              doCheck = false;
            })
          else prev.openldap;
      })
    ];

    environment.systemPackages = with pkgs; [
      azahar
      cemu
      eden
      lutris-free
      bottles
    ];
  };
}
