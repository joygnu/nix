{
  pkgs,
  username,
  ...
}: let
  helixConfig = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        shell = ["zsh" "-c"];
      };
      keys.normal = {
        Z.Z = ":wq";
        Z.Q = ":q!";
        space.space = "file_picker";
        esc = ["collapse_selection" "keep_primary_selection"];
      };
    };
  };
  packages = with pkgs; [nil pandoc texliveTeTeX];
in {
  home-manager.users = {
    ${username} = {
      programs.helix = helixConfig;
      home.packages = packages;
    };
    root = {
      programs.helix = helixConfig;
      home.packages = packages;
    };
  };
}
