{
  settings,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''
    exec-once=waybar
  '';
}
