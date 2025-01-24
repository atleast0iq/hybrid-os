{
  pkgs,
  pkgs-unstable,
  ...
}: {
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
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
      video-downloader
    ]);

  programs = {
    zathura = {
      enable = true;
      options.selection-clipboard = "clipboard";
    };
  };
}
