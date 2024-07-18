{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./greetd.nix
    ./upower.nix
  ];
}
