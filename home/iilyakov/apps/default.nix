{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./firefox
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

    # wine
    lutris
    wineWowPackages.stable
    winetricks
  ];
}
