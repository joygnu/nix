{ ... }:
{
 services.openssh = {
  enable = true;
  authorizedKeysFiles = [
    
  ];
  settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no"; 
  };
};
}
