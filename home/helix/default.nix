{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      keys.normal = {
        space.space = "file_picker";
         Z.Z = ":wq";
         Z.Q = ":q!";
      };
    };
  };

  home.packages = with pkgs; [
    nil
  ];
}
