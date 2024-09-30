{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [];

    windowrule = [];

    windowrulev2 = [
      "noblur,class:^()$,title:^()$"

      "keepaspectratio,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "noborder,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "fullscreenstate, -1, 2,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "pin,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "fullscreenstate, -1, 2,class:^(firefox)$,title:^(Firefox)$"
      "pin,class:^(firefox)$,title:^(Firefox)$"
      "float,class:^(firefox)$,title:^(Firefox)$"

      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"

      "float,title:^(Open File)$"
      "float,title:^(Open Folder)$"
    ];
  };
}
