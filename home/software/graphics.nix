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
      lmms
      obs-studio
      libreoffice
      gimp
      pkgs-unstable.video-downloader
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
    ]);

  programs = {
    zathura.enable = true;
  };
}
