{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./binds.nix
    ./env.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./plugins.nix
    ./portal.nix
    ./rules.nix
    ./settings.nix
  ];
}
