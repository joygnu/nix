{ lib, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    # themes = lib.mkForce "gruvbox";
    settings = {
     # lsp.display-messages = true;
      keys.normal = {
        space.space = "file_picker";
         Z.Z = ":wq";
         Z.Q = ":q!";
      };
    };
  };
}
