{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
     # lsp.display-messages = true;
      keys.normal = {
        space.space = "file_picker";
         Z.Z = ":wq";
         Z.Q = ":q";
      };
    };
  };
}
