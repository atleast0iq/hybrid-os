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
    ./programming
    ./wm
  ];

  home = {
    stateVersion = "24.05";

    username = "iilyakov";
    homeDirectory = "/home/iilyakov";
    sessionPath = ["$HOME/.local/bin"];
  };

  programs.home-manager.enable = true;

  services = {
    udiskie.enable = true;
  };

  stylix = {
    enable = true;
    polarity = "dark";
    image = ./wallpapers/ayu-dark.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata Modern Classic";
    };

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

  gtk = {
    iconTheme = {
      package = pkgs.numix-icon-theme;
      name = "Numix";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
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
