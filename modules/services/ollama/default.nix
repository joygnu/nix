{
  lib,
  config,
  pkgs-stable,
  ...
}: {
  options = {
    ollama.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.ollama.enable {
    services.ollama = {
      enable = true;
    };
    services.open-webui = {
      enable = true;
      package = pkgs-stable.open-webui;
      openFirewall = true;
      host = "0.0.0.0";
    };
  };
}
