{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 3;
        };
      };
      display = {
        color = "blue";
      };
      modules = [
        "title"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "cpu"
        "memory"
        "disk"
        "break"
        "colors"
      ];
    };
  };
}
