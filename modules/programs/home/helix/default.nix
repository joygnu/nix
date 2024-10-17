{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = lib.mkForce "gruvbox";
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
    texlab
    nil
    clang-tools
    javascript-typescript-langserver
    vscode-langservers-extracted
    rust-analyzer
    lldb_18
    lua-language-server
    jdt-language-server
    gopls
    dockerfile-language-server-nodejs
    python312Packages.python-lsp-server
    omnisharp-roslyn
    dotnetCorePackages.dotnet_8.sdk
    go
    marksman
    pandoc
    multimarkdown
    md2pdf
  ];
}
