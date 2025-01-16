{pkgs, ...}: {
  imports = [
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    mindustry-wayland

    (lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.waylandFull
        attr
        gamescope
        mangohud
        libthai
        pango

        zandronum
      ];

      extraLibraries = pkgs: [
        attr
      ];
    })
  ];
}
