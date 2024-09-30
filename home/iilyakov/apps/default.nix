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
    ./starship.nix
  ];

  home.packages =
    (with pkgs; [
      anytype
      vesktop
      qbittorrent
      gnome.nautilus
      gnome.eog
      bitwarden-desktop
      tenacity
      vlc
      lmms
      spotify

      lutris
      wineWowPackages.stable
      winetricks

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
      jq
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
    zathura.enable = true;
  };
}
