{
  config,
  pkgs,
  pkgs-unstable,
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
  imports = [
    ./apps
    ./wm
  ];

  home = {
    stateVersion = "24.05";

    username = "iilyakov";
    homeDirectory = "/home/iilyakov";
    sessionPath = ["$HOME/.local/bin"];

    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "Iosevka"
          "FiraCode"
          "JetBrainsMono"
          "DroidSansMono"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  services = {
    udiskie.enable = true;
  };

  stylix = {
    enable = true;
    polarity = "dark";
    image = ./wallpapers/ayu-dark.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";

    fonts = {
      monospace = default_font;
      serif = default_font;
      sansSerif = default_font;
      emoji = default_font;
      sizes.applications = 15;
      sizes.terminal = 15;
    };

    opacity.terminal = 0.90;
  };

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    templates = null;
    desktop = null;
    publicShare = null;
  };
}
