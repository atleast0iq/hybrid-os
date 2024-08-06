{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    just
    alejandra
    mangohud
    gamemode
  ];

  programs = {
    adb.enable = true;

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
  };
}
