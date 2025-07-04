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
      acceleration = "rocm";
      loadModels = ["deepseek-r1:1.5b"];
    };
    services.open-webui.enable = true;
    services.open-webui.package = pkgs-stable.open-webui;
  };
}
