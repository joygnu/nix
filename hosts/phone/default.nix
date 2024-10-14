{pkgs, ...}: {
  environment.packages = with pkgs; [
    vim
    alejandra
    hostname
    zsh
    fish
    font-awesome
    fastfetch
    ipfetch
    ffmpeg
    yt-dlp
    lazygit
    unixtools.ping
    cowsay
    procps
    openssh_hpn
    git
    diffutils
    findutils
    utillinux
    tzdata
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Europe/Zurich";

  home-manager.config = {
    home.stateVersion = "24.05";

    imports = [
      ../../modules/programs/home/git
      ../../modules/programs/home/helix
      ../../modules/programs/home/zsh
      ../../modules/programs/home/zoxide
    ];
  };

  user.shell = "${pkgs.zsh}/bin/zsh";
  terminal = {
    font = "${pkgs.terminus_font_ttf}/share/fonts/truetype/TerminusTTF.ttf";
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
