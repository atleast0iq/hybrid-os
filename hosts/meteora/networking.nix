{ config, pkgs, lib, inputs, ... }: {
  networking = {
    networkmanager.enable = true;

    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";

    hostName = "meteora";
  };
} 
