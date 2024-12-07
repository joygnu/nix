{
  inputs,
  username,
  domain,
  nixpath,
  pkgs,
  pkgs-stable,
  ...
}: let
  mail = {
    a = "contact";
    b = "mail";
    c = "spyware";
  };
in {
  environment.packages = with pkgs; [
    openssh
    hostname
    gnugrep
  ];

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Europe/Zurich";

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit username;
      inherit domain;
      inherit nixpath;
      inherit mail;
      inherit pkgs-stable;
    };
    config = {
      home.stateVersion = "24.05";
      imports = [
        ./home.nix
      ];
    };
  };

  user.shell = "${pkgs.zsh}/bin/zsh";
  terminal = {
    colors = {
      background = "#282828";
      foreground = "#fbf1c7";
      color0 = "#282828";
      color1 = "#cc241d";
      color2 = "#98971a";
      color3 = "#d79921";
      color4 = "#458588";
      color5 = "#b16286";
      color6 = "#689d6a";
      color7 = "#a89984";
      color8 = "#928374";
      color9 = "#fb4934";
      color10 = "#b8bb26";
      color11 = "#fabd2f";
      color12 = "#83a598";
      color13 = "#d3869b";
      color14 = "#8ec07c";
      color15 = "#ebdbb2";
    };
  };
}
