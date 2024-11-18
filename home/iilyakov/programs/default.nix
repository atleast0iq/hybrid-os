{
  config,
  pkgs,
  pkgs-dc460ec,
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
