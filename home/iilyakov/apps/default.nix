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
    ./git.nix
    ./nushell.nix
    ./starship.nix
  ];

  home.packages =
    (with pkgs; [
      # graphical
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
    ])
    ++ (with pkgs-unstable; [
      zed-editor
      wireguard-tools
    ]);

  programs = {
    bat.enable = true;
  };
}
