{
  username,
  domain,
  lib,
  config,
  ...
}: {
  options = {
    syncthing-server.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.syncthing-server.enable {
    services.syncthing = {
      enable = true;
      dataDir = "/home/${username}";
      openDefaultPorts = true;
      configDir = "/home/${username}/.config/syncthing";
      user = username;
      group = "users";
      guiAddress = "0.0.0.0:8384";
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        devices = {
          "desktop" = {id = "3JXDF7C-C2PFYGY-6ZUOYLC-A5BEMOG-JBPHKW7-IFUP2OS-JVV3FA4-P4A6GA3";};
          "laptop" = {id = "IIBYS7B-KR3T5EW-L26OHIM-3MEEKYI-LT3JYG4-JZGDNDK-EXVZRCS-WXWVZQV";};
          "phone" = {id = "VJBOXP7-TL3MLUJ-QQ6EKM2-B4STXVT-QM4NYPW-HYZ3CFZ-SG7M7TQ-QQYTKAM";};
        };
        folders = {
          "Documents" = {
            path = "/home/${username}/doc";
            devices = ["laptop" "desktop" "phone"];
          };
          "Music" = {
            path = "/home/${username}/media/music";
            devices = ["laptop" "desktop" "phone"];
          };
        };
      };
    };
    sops.secrets.sync = {
      owner = username;
    };
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts."sync.${domain.a}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8384";
          proxyWebsockets = true;
          extraConfig =
            "proxy_ssl_server_name on;"
            + "proxy_pass_header Authorization;";
        };
      };
    };
  };
}
