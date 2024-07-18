{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  default_font = {
    name = "JetBrainsMono Nerd Font";
    package = pkgs.nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    };
  };
in {
  stylix = {
    enable = true;
    polarity = "dark";
    image = ./../../non-nix/wallpapers/evening-sky.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    fonts = {
      monospace = default_font;
      serif = default_font;
      sansSerif = default_font;
      emoji = default_font;
      sizes.applications = 15;
      sizes.terminal = 15;
    };

    opacity.terminal = 0.85;

    targets = {
      bat.enable = true;
      dunst.enable = true;
      firefox.enable = true;
      foot.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      nushell.enable = true;
      swaylock.enable = true;
      vesktop.enable = true;
      vscode.enable = true;
      zathura.enable = true;
    };
  };
}
