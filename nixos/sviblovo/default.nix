{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./hardware.nix
    ./misc.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./services.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "24.05";
}
