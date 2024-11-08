{username, ...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      AllowUsers = null;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8FnfVKPbbzPmZ3L0KuSMc8GD42rkIoIMay3c/r9zGkMBwRyluwP7OBR7SaTlp/w7iPHom3YwhGYa37HOXp/icSEMvFlYsCQOXWPkf7cNqyhEnycRsMojpKP2a6qxvcnuuCLY+xMwtlsX1h4nJFpsWHb2A62qBgdaOVrBlbVGd2ZuVCgiB+eenVagW3EFAO9jK5r6rSFciND7EMxBKfi6DbRma6UCejwGjpU0AHCZDikw5XKFhLUDbhdb9e02gyQxD5cs4Q2CuZ1PVt+Jb1GwHVnfh3wdEz5v7TWF+RUv85JXlRLrIYd2SEDpA6yvQIIT4YR2Bb1Tc/aC+zTdUdP+HMiBI32GGyplMfrE1dbj3quTfGN6cJ0TfPFOx7K+0N108fM7mehPtGT/uyB9nnMyYeLO45cgA1wMZZcT4egSvnnqe+6NO7j+zR0whl8+SbIru7HUK2Oa67SzxotQ7D8F27rx02Ie4UJqwbPsZGrxL7TlvNKUXQ4mOINkyE79tIshWncO71O6vJWzaoeYiye0mxc0AP3vYozdV3MgN34+5zscb/o4pwOQtthin8Nf1Y6o6H0poUz5YXYBdEKK/O0Wz3kxT6i/oZWZG7a18xCCKYnF1Jgdr7mfxkizLMkRqYsgM9CS0e0KoVJhu78TmMz8Eip9za1ncvGg3w1ZW6VG/6w=="
    ];
  };
}
