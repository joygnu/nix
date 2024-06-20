{ config, inputs, pkgs, ... }:

{
services.openssh = {
  enable = true;
  settings.PasswordAuthentication = false;
  settings.KbdInteractiveAuthentication = false;
};
}
