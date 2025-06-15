{
  pkgs,
  username,
  ...
}: let
  config = {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "gruvbox";
        editor = {
          line-number = "relative";
        };
        keys.normal = {
          Z.Z = ":wq";
          Z.Q = ":q!";
          space.space = "file_picker";
          esc = ["collapse_selection" "keep_primary_selection"];
          t = [
            ":write-all"
            ":new"
            ":insert-output ${pkgs.lazygit}/bin/lazygit"
            ":buffer-close!"
            ":redraw"
            ":reload-all"
          ];
        };
      };
    };
    home.packages = with pkgs; [nil pandoc texliveTeTeX];
  };
in {
  home-manager.users = {
    ${username} = config;
    root = config;
  };
}
