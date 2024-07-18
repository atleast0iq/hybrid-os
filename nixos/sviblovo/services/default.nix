{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./greetd.nix
  ];

  services = {
    upower.enable = true;
  };
}
