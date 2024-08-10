{ config
, pkgs
, pkgs-unstable
, lib
, inputs
, ...
}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [ ];

    windowrule = [ ];

    windowrulev2 = [
      "noblur,class:^()$,title:^()$"

      "keepaspectratio,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "noborder,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "fakefullscreen,class:^(firefox)$,title:^(Firefox)$"
      "fakefullscreen,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "pin,class:^(firefox)$,title:^(Firefox)$"
      "pin,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "float,class:^(firefox)$,title:^(Firefox)$"
      "float,class:^(firefox)$,title:^(Picture-in-Picture)$"

      "float,class:^(floating)$,title:^(foot)$"
      "size 50% 50%,class:^(floating)$,title:^(foot)$"
      "center,class:^(floating)$,title:^(foot)$"

      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"
    ];
  };
}
