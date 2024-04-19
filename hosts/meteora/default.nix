{ config, lib, pkgs, inputs, ... }: {
  imports = [ 
    ./hardware-configuration.nix # some hardware stuff

    ./boot.nix # bootloader options
    ./nix.nix # nix and nixpkgs
    ./networking.nix # networking
    ./locale.nix # timezone and locale
    ./users.nix # users
    ./packages.nix # system packages
    ./services.nix # services
    ./misc.nix # console and variables setup
  ];

  # system version
  system.stateVersion = "23.11";
}
