{
  config,
  pkgs,
  pkgs-unstable,
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
  ];

  system.stateVersion = "24.05";
}
