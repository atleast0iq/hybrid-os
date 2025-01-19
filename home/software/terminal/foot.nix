{...}: {
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        term = "foot";
        title = "foot";
        pad = "15x15center";
        selection-target = "clipboard";
      };

      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
