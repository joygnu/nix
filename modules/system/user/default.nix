{...}: {
  users.users.joy = {
    isNormalUser = true;
    description = "joy";
    extraGroups = ["wheel"];
  };
}
