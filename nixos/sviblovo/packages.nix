{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    just
    alejandra
  ];

  programs = {
    adb.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraLibraries = pkgs:
          with pkgs; [
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            libkrb5
            stdenv.cc.cc.lib
            keyutils
            gperftools
          ];
      };

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      extraPackages = with pkgs; [
        pango
        libthai
        harfbuzz
        gamescope
        gamemode
        pkgsi686Linux.gperftools
      ];
    };

    zsh.enable = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "Iosevka"
        "FiraCode"
        "JetBrainsMono"
        "DroidSansMono"
        "UbuntuMono"
        "SpaceMono"
      ];
    })
    google-fonts
  ];
}
