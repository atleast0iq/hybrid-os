{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "systemctl --user start hyprpolkitagent"
    "blueman-applet"
    "hyprctl setcursor WhiteSur-cursors 22 &"
  ];
}
