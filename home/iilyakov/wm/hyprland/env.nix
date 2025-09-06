{...}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DEKSTOP,Hyprland"
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,gtk3"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "MOZ_ENABLE_WAYLAND,1"
      "XDG_SESSION_TYPE,wayland"
      "GDK_BACKEND,wayland"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    ];
  };
}
