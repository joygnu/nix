{
  username,
  pkgs,
  mcsr-nixos,
  lib,
  config,
  ...
}: let
  mcsrPkgs = mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [mcsr-nixos.nixosModules.waywall];
  options = {
    minecraft.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.minecraft.enable {
    environment.systemPackages = [
      pkgs.zulu8
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

        files = {
          overlay = builtins.fetchurl {
            url = "https://joygnu.org/overlay.png";
            sha256 = "0aim52jc5ly0g0vbzaxil6fvna5l0syk3rr3vmsyrvpg8jvbd4mj";
          };
        };
      };
    };

    home-manager.users.${username} = {
      programs.ninjabrain-bot = {
        enable = true;
        stylix = true;
        settings = {
          hotkey_decrement.key = 122955;
          hotkey_increment.key = 122957;
          hotkey_reset.key = 65557;
          hotkey_undo.key = 65558;
          hotkey_redo.key = 65559;
          hotkey_lock.key = 65560;

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
          direction_help_enabled = false;
          show_angle_errors = false;
          show_angle_updates = true;
          sigma_boat = 0.0007;
          stronghold_display_type = "eighteight";
          use_adv_statistics = false;
          use_precise_angle = true;

          enable_http_server = true;
        };
      };
    };

    environment.etc."libinput/local-overrides.quirks".text = ''
      [Never Debounce]
      MatchUdevType=mouse
      ModelBouncingKeys=1
    '';
  };
}
