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
    ./fish.nix
    ./foot.nix
    ./git.nix
    ./spotify.nix
    ./starship.nix
  ];

  home.packages =
    (with pkgs; [
      # graphical
      telegram-desktop
      vesktop
      qbittorrent
      gnome.nautilus
      bitwarden-desktop
      tenacity
      vlc

      # wine
      lutris
      wineWowPackages.stable
      winetricks

      # misc
      ripgrep
      fd
      cpufetch
      fastfetch
      wget
      curl
      btop
      brightnessctl
      pulsemixer
      acpi
      killall
      grim
      slurp
      wl-clipboard
      xdg-user-dirs
      wev
      unzip
      eza
    ])
    ++ (with pkgs-unstable; [
      wireguard-tools
      openvpn
    ]);

  programs = {
    bat.enable = true;
  };
}
