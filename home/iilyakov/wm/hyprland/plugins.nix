{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.plugins = with pkgs; [
    hyprlandPlugins.hyprspace
  ];

  wayland.windowManager.hyprland.extraConfig = ''
  '';
}
