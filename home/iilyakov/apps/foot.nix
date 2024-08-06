{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        term = "foot";
        title = "foot";
        font = lib.mkDefault "JetBrainsMono:size=15";
      };

      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
