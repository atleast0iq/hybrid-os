{
  settings,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''
    exec-once=${pkgs.waybar}/bin/waybar
  '';
}
