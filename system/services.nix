{ lib, pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    upower.enable = true;
    udisks2.enable = true;
  };

  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
