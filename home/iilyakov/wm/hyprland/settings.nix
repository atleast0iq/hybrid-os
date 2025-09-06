{
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [
        "eDP-1,1920x1080@60,0x0,1"
        "HDMI-A-1,1920x1080,-1920x0,1"
      ];

      workspace = [
        "eDP-1,1"
        "HDMI-A-1,11"

        "1,monitor:eDP-1"
        "2,monitor:eDP-1"
        "3,monitor:eDP-1"
        "4,monitor:eDP-1"
        "5,monitor:eDP-1"
        "6,monitor:eDP-1"
        "7,monitor:eDP-1"
        "8,monitor:eDP-1"
        "9,monitor:eDP-1"
        "10,monitor:eDP-1"

        "11,monitor:HDMI-A-1"
        "12,monitor:HDMI-A-1"
        "13,monitor:HDMI-A-1"
        "14,monitor:HDMI-A-1"
        "15,monitor:HDMI-A-1"
        "16,monitor:HDMI-A-1"
        "17,monitor:HDMI-A-1"
        "18,monitor:HDMI-A-1"
        "19,monitor:HDMI-A-1"
        "20,monitor:HDMI-A-1"
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
        gaps_out = "7, 20, 20, 20";
        border_size = 1;
        layout = "dwindle";
        "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base0D}ba)";
        "col.inactive_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base02}ba)";
      };

      decoration = {
        rounding = 9;

        shadow = {
          enabled = true;
          ignore_window = true;
          offset = "2 2";
          range = 30;
          render_power = 3;
        };

        blur = {
          enabled = true;
          special = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0;
          passes = 1;
          size = 5;
        };
      };

      animation = {
        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];
        animation = [
          "windowsIn, 1, 1.7, easeOutCubic, slide"
          "windowsOut, 1, 1.7, easeOutCubic, slide"
          "windowsMove, 1, 2.5, easeinoutsine, slide"

          "fadeIn, 1, 3, easeOutCubic"
          "fadeOut, 1, 3, easeOutCubic"
          "fadeSwitch, 1, 5, easeOutCirc"
          "fadeShadow, 1, 5, easeOutCirc"
          "fadeDim, 1, 6, fluent_decel"
          "border, 1, 2.7, easeOutCirc"
          "workspaces, 1, 2, fluent_decel, slide"
          "specialWorkspace, 1, 3, fluent_decel, slidevert"
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
