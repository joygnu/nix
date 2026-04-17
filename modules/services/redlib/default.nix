{
  config,
  lib,
  pkgs,
  domain,
  ...
}: let
  src = pkgs.fetchFromGitHub {
    owner = "Silvenga";
    repo = "redlib";
    rev = "af002ab216d271890e715c2d3413f7193c07c640";
    hash = "sha256-Ny/pdBZFgUAV27e3wREPV8DUtP3XfMdlw0T01q4b70U=";
  };
  redlib-fork = pkgs.redlib.overrideAttrs (oldAttrs: {
    version = "0.36.0-unstable-2026-04-04";
    inherit src;
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit src;
      name = "redlib-0.36.0-unstable-2026-04-04-vendor";
      hash = "sha256-eO3c7rlFna3DuO31etJ6S4c7NmcvgvIWZ1KVkNIuUqQ=";
    };
    nativeBuildInputs =
      (oldAttrs.nativeBuildInputs or [])
      ++ (with pkgs; [
        cmake
        go
        perl
        git
        rustPlatform.bindgenHook
      ]);
    checkFlags =
      (oldAttrs.checkFlags or [])
      ++ [
        "--skip=oauth::tests::test_generic_web_backend"
        "--skip=oauth::tests::test_mobile_spoof_backend"
      ];
  });
in {
  options = {
    redlib.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.redlib.enable {
    services.redlib = {
      package = redlib-fork;
      enable = true;
      port = 7070;
    };
    services.nginx = {
      virtualHosts."red.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          client_max_body_size 512M;
          client_body_buffer_size 32k;
        '';
        locations."/" = {
          proxyPass = "http://localhost:7070";
        };
        locations."= /robots.txt" = {
          extraConfig = ''
            add_header Content-Type text/plain;
            return 200 "User-agent: *\nDisallow: /\n";
            access_log off;
          '';
        };
      };
    };
  };
}
