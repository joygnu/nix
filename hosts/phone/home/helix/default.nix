{...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      keys.normal = {
        space.space = "file_picker";
        Z.Z = ":wq";
        Z.Q = ":q!";
      };
    };
  };
}
