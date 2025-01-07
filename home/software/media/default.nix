{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    qbittorrent
    eog
    vlc
    lmms
    obs-studio
    libreoffice
    gimp
    pkgs-unstable.video-downloader

    # games
    mindustry-wayland
  ];

  programs = {
    zathura.enable = true;
  };
}
