{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.steam = {
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
      pkgsi686Linux.gperftools
    ];
  };

  environment.systemPackages = with pkgs; [
    mangohud
    gamemode
  ];
}
