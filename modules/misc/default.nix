{ config, inputs, pkgs, ... }:

{
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  services = {
    syncthing = {
        enable = true;
        user = "joy";
        dataDir = "/home/joy/";
        configDir = "/home/joy/.config/syncthing";  
    };
  };

services.pcscd.enable = true;
programs.gnupg.agent = {
   enable = true;
   pinentryPackage = pkgs.pinentry-curses;
   enableSSHSupport = true;
};

programs.neovim = {
  enable = true;
  defaultEditor = true;
};
  
  programs.hyprland.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true; 
    
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
