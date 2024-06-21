{ config, inputs, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = true;
    #settings.PermitRootLogin = "yes";
  };
  
 # users.users.joy.openssh.authorizedKeys.keys = [
 # "ssh-rsa AAAAB3Nz....6OWM= user" # content of authorized_keys file
  # note: ssh-copy-id will add user@your-machine after the public key
  # but we can remove the "@your-machine" part
#];
 
}
