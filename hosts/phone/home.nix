{ pkgs, ... }:
{
    home.stateVersion = "24.05";
    
    imports = [
      ./home
    ];

 }