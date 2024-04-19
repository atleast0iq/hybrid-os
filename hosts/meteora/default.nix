{ config, lib, pkgs, inputs, ... }: {
  imports = [ 
    ./hardware-configuration.nix
    ./modules
  ];

  system.stateVersion = "23.11";
}
