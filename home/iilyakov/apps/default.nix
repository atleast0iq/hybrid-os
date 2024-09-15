{
  config,
  pkgs,
  pkgs-unstable,
  pkgs-2311,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./ags
    ./firefox.nix
    ./foot.nix
    ./git.nix
    ./nushell.nix
    ./spotify.nix
    ./starship.nix
  ];

  home.packages =
    (with pkgs; [
      # graphical
      vesktop
      qbittorrent
      gnome.nautilus
      bitwarden-desktop
      tenacity
      vlc
      lmms

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
      libqalculate
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop

      wireguard-tools
      openvpn
    ])
    ++ (with pkgs-2311; [
      jetbrains.clion
    ]);

  programs = {
    bat.enable = true;
  };
}
