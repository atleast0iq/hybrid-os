{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages =
    (with pkgs; [
      nautilus
      bitwarden-desktop
      obsidian
      simple-scan
      qbittorrent
      eog
      vlc
      obs-studio
      libreoffice
      gimp
      xournalpp

      adwsteamgtk
      mindustry-wayland
      (lutris.override {
        extraPkgs = pkgs: [
          wineWowPackages.waylandFull
          attr
          gamescope
          mangohud
          libthai
          pango
          zandronum
        ];

        extraLibraries = pkgs: [
          attr
        ];
      })
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
      video-downloader
      amnezia-vpn
    ]);

  programs = {
    zathura = {
      enable = true;
      options.selection-clipboard = "clipboard";
    };
  };
}
