{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.plugins = with pkgs; [
    hyprlandPlugins.hyprexpo
  ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      hyprexpo {
        workspace_method = first 1
        gesture_fingers = 3
      }
    }
  '';
}
