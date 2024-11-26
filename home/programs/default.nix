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
    ./zed-editor.nix

    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    chromium
    qbittorrent
    nautilus
    eog
    bitwarden-desktop
    vlc
    telegram-desktop
    obs-studio
    libreoffice
    obsidian

    jetbrains.pycharm-community
    pkgs-2311.jetbrains.clion
    pkgs-2311.jetbrains.goland

    gcc
    gdb
    clang-tools
    python3
    nixd
    nil
    go

    gnumake
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
  ];

  programs = {
    spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;
      spotifyPackage = pkgs.spotify-unwrapped;
      theme = lib.mkForce spicePkgs.themes.sleek;
      colorScheme = lib.mkForce "custom";
      customColorScheme = {
        text = "${config.lib.stylix.colors.base05}";
        subtext = "${config.lib.stylix.colors.base04}";
        nav-active-text = "${config.lib.stylix.colors.base0D}";
        main = "${config.lib.stylix.colors.base01}";
        sidebar = "${config.lib.stylix.colors.base01}";
        player = "${config.lib.stylix.colors.base01}";
        card = "${config.lib.stylix.colors.base01}";
        shadow = "000000";
        main-secondary = "${config.lib.stylix.colors.base01}";
        button = "${config.lib.stylix.colors.base04}";
        button-secondary = "${config.lib.stylix.colors.base0C}";
        button-active = "${config.lib.stylix.colors.base0D}";
        button-disabled = "${config.lib.stylix.colors.base01}";
        nav-active = "${config.lib.stylix.colors.base01}";
        play-button = "${config.lib.stylix.colors.base0D}";
        tab-active = "${config.lib.stylix.colors.base01}";
        notification = "${config.lib.stylix.colors.base01}";
        notification-error = "${config.lib.stylix.colors.base01}";
        playback-bar = "${config.lib.stylix.colors.base0D}";
        misc = "f4dbd6";
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
