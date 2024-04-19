{ config, lib, pkgs, inputs, ... }: {
  imports = [ 
    ./boot.nix
    ./nix.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./packages.nix
    ./services.nix
    ./misc.nix
  ];
}
