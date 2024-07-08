{ ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil-ls = { enable = true; };
      kotlin-language-server = { enable = true; };
      rust-analyzer = { enable = true; installCargo = true; installRustc = true; };
      pyright = { enable = true; };
    };
  };
}
