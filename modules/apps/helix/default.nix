{pkgs, ...}: {
  home-manager.users.joy.programs.helix = {
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

  home-manager.users.joy.home.packages = with pkgs; [
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
    netcoredbg
    dotnetCorePackages.sdk_9_0
    texlab
  ];
}