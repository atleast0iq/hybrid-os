{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "$HOME/hybrid-os/home/iilyakov/wallpapers/ayu-dark.png";
        }
      ];

      input-field = [
        {
          size = "400, 50";
          position = "0, -300";
          monitor = "";
          font = "JetBrainsMono Nerd Font";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "Password...";
          shadow_passes = 2;
        }
      ];
    };
  };
}
