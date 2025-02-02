{pkgs, ...}: let
  ipinfoScript = pkgs.writeScriptBin "ipc" ''
    #!/bin/sh

    local_ip=$(ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d/ -f1 | head -n 1)

    public_ip=$(curl -s ifconfig.me)

    echo "Local IP Address: $local_ip"
    echo "Public IP Address: $public_ip"
  '';
in {
  environment.systemPackages = [ipinfoScript];
}
