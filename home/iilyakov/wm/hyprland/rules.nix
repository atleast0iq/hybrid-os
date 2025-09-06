{...}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [];

    windowrule = [];

    windowrulev2 = [
      "noblur,class:^()$,title:^()$"

      "keepaspectratio,title:^(Picture-in-Picture)$"
      "noborder,title:^(Picture-in-Picture)$"
      "fullscreenstate, -1, 2,title:^(Picture-in-Picture)$"
      "float,title:^(Picture-in-Picture)$"
      "pin,title:^(Picture-in-Picture)$"

      "fullscreenstate, -1, 2,class:^(firefox)$,title:^(Firefox)$"
      "pin,class:^(firefox)$,title:^(Firefox)$"
      "float,class:^(firefox)$,title:^(Firefox)$"
      "float,title:^(codeblocks_term)$"
      "size 700 500,title:^(codeblocks_term)$"

      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"

      "float,title:^(Open File)$"
      "float,title:^(Open Folder)$"

      "opacity 0.9 0.9 1.0,class:^(org.pwmt.zathura)$"
      "opacity 0.9 0.9 1.0,class:^(VSCodium)$"
    ];
  };
}
