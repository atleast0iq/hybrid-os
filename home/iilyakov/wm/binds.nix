{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];

    bindl = [
      # ",switch:on:Lid Switch,exec,hyprlock"
      ",switch:off:Lid Switch,exec,hyprlock"
    ];

    bindle = [
      ",XF86MonBrightnessUp,exec,brightnessctl set +10%"
      ",XF86MonBrightnessDown,exec,brightnessctl set 10%-"

      ",XF86AudioRaiseVolume,exec,pulsemixer --change-volume +10"
      ",XF86AudioLowerVolume,exec,pulsemixer --change-volume -10"
    ];

    bind = [
      "$mod,delete,exit,"
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
      ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_SINK@ toggle"
      ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_SOURCE@ toggle"

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

      "$mod,1,workspace,1"
      "$mod,2,workspace,2"
      "$mod,3,workspace,3"
      "$mod,4,workspace,4"
      "$mod,5,workspace,5"
      "$mod,6,workspace,6"
      "$mod,7,workspace,7"
      "$mod,8,workspace,8"
      "$mod,9,workspace,9"
      "$mod SHIFT,1,movetoworkspace,1"
      "$mod SHIFT,2,movetoworkspace,2"
      "$mod SHIFT,3,movetoworkspace,3"
      "$mod SHIFT,4,movetoworkspace,4"
      "$mod SHIFT,5,movetoworkspace,5"
      "$mod SHIFT,6,movetoworkspace,6"
      "$mod SHIFT,7,movetoworkspace,7"
      "$mod SHIFT,8,movetoworkspace,8"
      "$mod SHIFT,9,movetoworkspace,9"

      "$mod CTRL,l,resizeactive,10 0"
      "$mod CTRL,h,resizeactive,-10 0"
      "$mod CTRL,k,resizeactive,0 -10"
      "$mod CTRL,j,resizeactive,0 10"
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
  '';
}
