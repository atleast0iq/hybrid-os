{config, ...}: {
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Music";
      videos = "${config.home.homeDirectory}/Videos";
      pictures = "${config.home.homeDirectory}/Pictures";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      templates = null;
      desktop = null;
      publicShare = null;
    };

    mimeApps.enable = true;
    configFile."mimeapps.list".force = true;
    mimeApps.defaultApplications = {
      "inode/directory" = ["org.gnome.Nautilus.desktop"];
      "default-web-browser" = ["zen.desktop"];
      "text/html" = ["zen.desktop"];
      "x-scheme-handler/http" = ["zen.desktop"];
      "x-scheme-handler/https" = ["zen.desktop"];
      "x-scheme-handler/about" = ["zen.desktop"];
      "x-scheme-handler/unknown" = ["zen.desktop"];
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };
}
