{
  config,
  pkgs,
  pkgs-unstable,
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
    ./vscode.nix
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
      libqalculate
    ])
    ++ (with pkgs-unstable; [
      wireguard-tools
      openvpn
    ]);

  programs = {
    bat.enable = true;
  };
}
