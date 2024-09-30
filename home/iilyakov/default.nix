{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./apps
    ./programming
    ./wm
    ./stylix.nix
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

  xdg = {
    enable = true;

    userDirs = {
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

    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "inode/directory" = "org.gnome.Nautilus.desktop";
    };
  };
}
