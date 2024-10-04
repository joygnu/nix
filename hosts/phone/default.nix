{pkgs, ...}: {
  environment.packages = with pkgs; [
    vim
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

  time.timeZone = "Europe/Berlin";

  home-manager.config = {
    home.stateVersion = "24.05";

    imports = [
      ./home
    ];
  };

  user.shell = "${pkgs.zsh}/bin/zsh";

  terminal = {
    colors = {
      background = "#282828";
      foreground = "#fbf1c7";
    };
  };
}
