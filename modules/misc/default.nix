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
  programs.hyprland.enable = true;
  programs.zsh.enable = true; 
  users.defaultUserShell = pkgs.zsh;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  programs.nix-ld.enable = true;
  services.printing.enable = true;
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
  home-manager.backupFileExtension = "backup";
}
