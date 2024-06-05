{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  yazi
  jq
  poppler
  fd
  ripgrep
  fzf
  zoxide
  ];
}
