{ config, inputs, pkgs, ... }:

{
  
  programs.hyprland.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true; 
  programs.gnupg.agent.enable = true;
  boot.initrd.luks.gpgSupport = true;
    
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
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  time.timeZone = "Europe/Zurich";

  virtualisation.docker.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.nix-ld.enable = true;

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  system.stateVersion = "23.11";

}
