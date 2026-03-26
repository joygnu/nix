{
  username,
  pkgs,
  mcsr-nixos,
  ...
}: let
  mcsrPkgs = mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [mcsr-nixos.nixosModules.waywall];

  environment.systemPackages = [
    mcsrPkgs.ninjabrain-bot

    (pkgs.prismlauncher.override {
      jdks = [mcsrPkgs.graalvm-21];
    })
  ];

  programs.waywall = {
    enable = true;
    config = {
      enableWaywork = true;
      programs = [mcsrPkgs.ninjabrain-bot];
      source = ./waywall.lua;
    };
  };
  home-manager.users.${username} = {
    programs.ninjabrain-bot = {
      enable = true;
      stylix = true;
      settings = {
        hotkey_decrement.key = 57419; # "right"
        hotkey_increment.key = 57421; # "left"

        hotkey_lock.key = 23; # "i"
        hotkey_undo.key = 22; #u
        hotkey_redo.key = 21; #y
        hotkey_reset = {
          key = 19; # "r"
          modifiers = ["ALT_L"];
        };

        view = "basic";
        all_advancements = false;
        mc_version = "pre_119";
        sensitivity = 0.02291165;

        default_boat_type = "green";
        alt_clipboard_reader = false;
        angle_adjustment_display_type = "increments";
        angle_adjustment_type = "tall";
        auto_reset = false;
        color_negative_coords = false;
        direction_help_enabled = true;
        show_angle_errors = true;
        show_angle_updates = true;
        sigma_boat = 0.0007;
        stronghold_display_type = "eighteight";
        use_adv_statistics = true;
        use_precise_angle = true;

        enable_http_server = true;
      };
    };
  };
}
