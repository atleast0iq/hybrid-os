{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./autostart.nix
    ./binds.nix
    ./env.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./plugins.nix
    ./rules.nix
    ./settings.nix
    ./xdg-portal.nix
  ];
}
