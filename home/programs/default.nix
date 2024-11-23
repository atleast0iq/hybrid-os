{
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
        text = "bfbdb6";
        subtext = "565b66";
        nav-active-text = "59c2ff";
        main = "0b0e14";
        sidebar = "0b0e14";
        player = "0b0e14";
        card = "0b0e14";
        shadow = "000000";
        main-secondary = "0b0e14";
        button = "475266";
        button-secondary = "74c7ec";
        button-active = "59c2ff";
        button-disabled = "181825";
        nav-active = "0d1017";
        play-button = "59c2ff";
        tab-active = "0b0e14";
        notification = "0b0e14";
        notification-error = "0b0e14";
        playback-bar = "59c2ff";
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
