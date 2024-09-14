{pkgs,lib,...}: { environment.systemPackages = [
  (let
    packagesWithSchemas = [
      pkgs.nemo
    ];
  in
  pkgs.runCommand "ngsettings" {
    nativeBuildInputs = [
      pkgs.makeWrapper
    ];
  } ''
    mkdir -p "$out/bin"
    # Creates ngsettings program (wrapped gsettings)
    makeWrapper "${pkgs.glib.bin}/bin/gsettings" "$out/bin/ngsettings" \
      --set XDG_DATA_DIRS "${lib.concatMapStringsSep ":" pkgs.glib.getSchemaDataDirPath packagesWithSchemas}"
  '')
  pkgs.nemo
  ];
}
