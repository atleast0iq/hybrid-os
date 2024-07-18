{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  users = {
    users.iilyakov = {
      isNormalUser = true;
      description = "Ivan Ilyakov";
      extraGroups = ["networkmanager" "wheel" "input" "docker"];
      createHome = true;
      home = "/home/iilyakov";
      shell = pkgs.nushell;
    };
  };
}
