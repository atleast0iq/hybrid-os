{pkgs-stable, ...}: {
  programs.steam = {
    enable = true;
    package = pkgs-stable.steam.override {
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

    extraPackages = with pkgs-stable; [
      pango
      libthai
      harfbuzz
      gamescope
      gamemode
      pkgsi686Linux.gperftools
    ];

    extraCompatPackages = [pkgs-stable.proton-ge-bin];
  };

  environment.systemPackages = with pkgs-stable; [
    mangohud
    gamemode
  ];
}
