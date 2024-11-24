{pkgs, ...}: {
  programs.helix = {
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

  home.packages = with pkgs; [
    nil
    pandoc
  ];
}
