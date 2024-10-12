{
  config,
  pkgs,
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
      anytype
      vesktop
      qbittorrent
      nautilus
      eog
      bitwarden-desktop
      tenacity
      vlc
      lmms
      telegram-desktop
      obs-studio

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
