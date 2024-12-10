{...}: {
  wayland.windowManager.hyprland.extraConfig = ''
    exec-once=waybar
    exec-once=systemctl --user start hyprpolkitagent
    exec-once=blueman-applet
  '';
}
