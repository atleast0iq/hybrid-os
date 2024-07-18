{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
  ];

  home.packages = with pkgs; [
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;

    plugins = [
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    settings = {
      "$mainMod" = "SUPER";

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
        sensitivity = 0;
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
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        drop_shadow = false;
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

      bind = [
        "$mainMod,c,killactive,"
        "$mainMod SHIFT,m,exit,"

        "$mainMod,1,workspace,1"
        "$mainMod,2,workspace,2"
        "$mainMod,3,workspace,3"
        "$mainMod,4,workspace,4"
        "$mainMod,5,workspace,5"
        "$mainMod,6,workspace,6"
        "$mainMod,7,workspace,7"
        "$mainMod,8,workspace,8"
        "$mainMod,9,workspace,9"
        "$mainMod SHIFT,1,movetoworkspacesilent,1"
        "$mainMod SHIFT,2,movetoworkspacesilent,2"
        "$mainMod SHIFT,3,movetoworkspacesilent,3"
        "$mainMod SHIFT,4,movetoworkspacesilent,4"
        "$mainMod SHIFT,5,movetoworkspacesilent,5"
        "$mainMod SHIFT,6,movetoworkspacesilent,6"
        "$mainMod SHIFT,7,movetoworkspacesilent,7"
        "$mainMod SHIFT,8,movetoworkspacesilent,8"
        "$mainMod SHIFT,9,movetoworkspacesilent,9"

        "$mainMod,h,movefocus,l"
        "$mainMod,l,movefocus,r"
        "$mainMod,k,movefocus,u"
        "$mainMod,j,movefocus,d"
        "$mainMod SHIFT,h,movewindow,l"
        "$mainMod SHIFT,l,movewindow,r"
        "$mainMod SHIFT,k,movewindow,u"
        "$mainMod SHIFT,j,movewindow,d"

        "$mainMod CTRL,l,resizeactive,10 0"
        "$mainMod CTRL,h,resizeactive,-10 0"
        "$mainMod CTRL,k,resizeactive,0 -10"
        "$mainMod CTRL,j,resizeactive,0 10"

        "$mainMod,s,togglefloating,"
        "$mainMod,f,fullscreen,2"
        "$mainMod,p,pin,"

        "SUPER,q,exec,foot"
      ];

      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];

      bindle = [
        ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"

        ",XF86AudioRaiseVolume,exec,pulsemixer --change-volume +5"
        ",XF86AudioLowerVolume,exec,pulsemixer --change-volume -5"
      ];

      bindl = [
        # ",switch:on:Lid Switch, exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
        # ",switch:off:Lid Switch, exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
      ];

      plugin = {
        overview = {
          panelHeight = 80;
          gapsIn = 5;
          gapsOut = 10;
          workspaceMargin = 10;
          overrideAnimSpeed = 0.1;
        };
      };
    };
  };
}
