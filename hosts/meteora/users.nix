{ config, pkgs, lib, inputs, ... }: {
  users.users = {
    iilyakov = {
      isNormalUser = true;
      description = "Ivan Ilyakov";
      extraGroups = [ "networkmanager" "wheel" ];
      createHome = true;
      home = "/home/iilyakov";
    };
  };
}
