{
  config,
  pkgs,
  pkgs-2311,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./shell.nix

    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    chromium
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

    gcc
    gdb
    clang-tools
    python3
    bun
    nodePackages_latest.nodejs
    nixd
    zed-editor
    vscode-fhs
    pkgs-2311.jetbrains.clion
    jetbrains.pycharm-community
    jetbrains.goland

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
  ];

  programs = {
    spicetify = {
      enable = true;
      spotifyPackage = pkgs.spotify-unwrapped;
    };

    foot = {
      enable = true;
      server.enable = true;

      settings = {
        main = {
          term = "foot";
          title = "foot";
          font = lib.mkDefault "JetBrainsMono:size=15";
          pad = "15x15center";
          selection-target = "clipboard";
        };

        tweak = {
          font-monospace-warn = "no";
          sixel = "yes";
        };
      };
    };

    bat.enable = true;
    zathura.enable = true;
  };
}
