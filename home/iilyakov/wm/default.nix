{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar
  ];
}
