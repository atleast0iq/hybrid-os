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
    go
    gnumake
    jetbrains.pycharm-community
    pkgs-2311.jetbrains.clion

    lutris
    wineWowPackages.stable
    winetricks
    mangohud
    gamemode

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
    spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;
      spotifyPackage = pkgs.spotify-unwrapped;
      theme = lib.mkForce spicePkgs.themes.text;
      colorScheme = lib.mkForce "custom";
      customColorScheme = {
        accent = "${config.lib.stylix.colors.base0D}";
        accent-active = "${config.lib.stylix.colors.base0D}";
        text = "${config.lib.stylix.colors.base05}";
        main = "${config.lib.stylix.colors.base00}";
      };
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
