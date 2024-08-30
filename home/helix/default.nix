{pkgs, ...}: {
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
    clang-tools
    javascript-typescript-langserver
    # vscode-langservers-extracted
    rust-analyzer
    lldb_18
    lua-language-server
    jdt-language-server
    gopls
    dockerfile-language-server-nodejs
    python312Packages.python-lsp-server
    omnisharp-roslyn
  ];
}
