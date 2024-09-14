{
 pkgs,
  lib,
  ...
}: {
  home-manager.users.joy.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = lib.mkForce "gruvbox";
      keys.normal = {
        space.space = "file_picker";
        Z.Z = ":wq";
        Z.Q = ":q!";
      };
    };
    
  };

  home-manager.users.joy.home.packages = with pkgs; [
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
  ];
}
