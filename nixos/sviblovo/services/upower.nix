{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.upower = {
    enable = true;
  };
}
