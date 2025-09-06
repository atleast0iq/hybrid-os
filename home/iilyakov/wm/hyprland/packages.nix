{
  lib,
  pkgs,
  ...
}: {
  programs = {
    zathura = {
      enable = true;
      options.selection-clipboard = "clipboard";
    };

    foot = {
      enable = true;
      server.enable = true;

      settings = {
        main = {
          term = "foot";
          title = "foot";
          font = lib.mkDefault "JetBrainsMono:size=15";
          pad = "15x15center";
          selection-target = "clipboard";
        };

        tweak = {
          font-monospace-warn = "no";
          sixel = "yes";
        };
      };
    };
  };

  home.packages = with pkgs; [
    dconf
    hyprpolkitagent
    hyprsome
  ];
}
