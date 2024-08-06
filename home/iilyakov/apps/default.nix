{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./foot.nix
  ];

  home.packages = with pkgs; [
    telegram-desktop
    vesktop
    spotify
    qbittorrent
    gnome.nautilus
    bitwarden-desktop
    tenacity
    vlc

    # wine
    lutris
    wineWowPackages.stable
    winetricks
  ];
}
