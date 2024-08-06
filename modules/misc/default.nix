{ inputs, pkgs, ... }:

{
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "joy" = import ./../../home;
    };
  };

  users.users.joy = {
    isNormalUser = true;
    description = "joy";
    extraGroups = [ "wheel" "docker" ];
  };  
 
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true; 
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  programs.nix-ld.enable = true;
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
}
