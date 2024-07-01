{ config, pkgs, lib, inputs, ... }: {
  imports = [
    ./git.nix
    ./fish.nix
  ];
}
