{...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];

    bindl = [
      "$mod,delete,exit,"
      ",switch:off:Lid Switch,exec,hyprlock"

      ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_SINK@ toggle"
      ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_SOURCE@ toggle"
    ];

    bindle = [
      ",XF86MonBrightnessUp,exec,brightnessctl set +10%"
      ",XF86MonBrightnessDown,exec,brightnessctl set 10%-"

      ",XF86AudioRaiseVolume,exec,pulsemixer --change-volume +10"
      ",XF86AudioLowerVolume,exec,pulsemixer --change-volume -10"
    ];

    bind = [
      "$mod,Escape,exec,hyprlock"

      "$mod,c,killactive,"
      "$mod,s,togglefloating,"
      "$mod,f,fullscreen,2"
      "$mod,p,pin,"

      "$mod SHIFT,o,togglesplit,"
      "$mod SHIFT,p,pseudo,"

      "$mod,Return,exec,foot"
      "$mod SHIFT,f,exec,firefox"
      "$mod SHIFT,s,exec,slurp | grim -g - - | wl-copy"
      ",Print,exec,grim - | wl-copy"
      "$mod,d,exec,rofi -show drun"

      "$mod,h,movefocus,l"
      "$mod,l,movefocus,r"
      "$mod,k,movefocus,u"
      "$mod,j,movefocus,d"
      "$mod SHIFT,h,movewindow,l"
      "$mod SHIFT,l,movewindow,r"
      "$mod SHIFT,k,movewindow,u"
      "$mod SHIFT,j,movewindow,d"

      "$mod, TAB, focusmonitor, +1"
      "$mod, mouse_down, workspace, r-1"
      "$mod, mouse_up, workspace, r+1"
      "$mod, mouse:274, killactive,"

      "$mod,w,togglespecialworkspace"
      "$mod SHIFT,w,movetoworkspacesilent,special"

      "$mod,1,exec,hyprsome workspace 1"
      "$mod,2,exec,hyprsome workspace 2"
      "$mod,3,exec,hyprsome workspace 3"
      "$mod,4,exec,hyprsome workspace 4"
      "$mod,5,exec,hyprsome workspace 5"
      "$mod,6,exec,hyprsome workspace 6"
      "$mod,7,exec,hyprsome workspace 7"
      "$mod,8,exec,hyprsome workspace 8"
      "$mod,9,exec,hyprsome workspace 9"
      "$mod SHIFT,1,exec,hyprsome movefocus 1"
      "$mod SHIFT,2,exec,hyprsome movefocus 2"
      "$mod SHIFT,3,exec,hyprsome movefocus 3"
      "$mod SHIFT,4,exec,hyprsome movefocus 4"
      "$mod SHIFT,5,exec,hyprsome movefocus 5"
      "$mod SHIFT,6,exec,hyprsome movefocus 6"
      "$mod SHIFT,7,exec,hyprsome movefocus 7"
      "$mod SHIFT,8,exec,hyprsome movefocus 8"
      "$mod SHIFT,9,exec,hyprsome movefocus 9"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    bind=$mod,r,submap,resize
    submap=resize
    binde=,l,resizeactive,30 0
    binde=,h,resizeactive,-30 0
    binde=,k,resizeactive,0 -30
    binde=,j,resizeactive,0 30
    bind=$mod,r,submap,reset
    submap=reset

    bind=$mod,m,submap,move
    submap=move
    binde=,l,moveactive,30 0
    binde=,h,moveactive,-30 0
    binde=,k,moveactive,0 -30
    binde=,j,moveactive,0 30
    bind=$mod,m,submap,reset
    submap=reset
  '';
}
