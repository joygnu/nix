{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    code.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.code.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
        jdinhlife.gruvbox
      ];
    };
  };
}
