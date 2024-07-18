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
    udisks2.enable = true;
  };
}
