{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
    settings = {
    };
  };
}
