{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = [
    ];

    settings = {
      monitor = [
        "eDP-1,1920x1080@60,0x0,1"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;
        sensitivity = 0.4;
        touchpad = {
          natural_scroll = 1;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 150;
      };

      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 0;
        layout = "dwindle";
        "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base0D}ff)";
        "col.inactive_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base02}ff)";
      };

      decoration = {
        rounding = 15;

        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "2 2";
        shadow_range = 20;
        shadow_render_power = 3;

        blur = {
          enabled = true;
          special = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
          passes = 1;
          size = 5;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 3, wind, slide"
          "windowsIn, 1, 3, winIn, popin"
          "windowsOut, 1, 2, winOut, slide"
          "windowsMove, 1, 2, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 15, liner, loop"
          "fade, 1, 5, default"
          "workspaces, 1, 2, wind"
        ];
      };

      misc = {
        disable_hyprland_logo = true;
        vfr = true;
        vrr = false;
      };

      dwindle = {
        pseudotile = true;
        force_split = 2;
        preserve_split = true;
      };

      master = {
        mfact = 0.55;
        orientation = "right";
        new_status = "slave";
      };
    };
  };
}
