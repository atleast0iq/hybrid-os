{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services = {
    udiskie.enable = true;
  };
}
