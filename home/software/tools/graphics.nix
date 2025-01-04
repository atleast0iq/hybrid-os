{
  pkgs,
  pkgs-unstable,
  pkgs-2311,
  ...
}: {
  home.packages =
    (with pkgs; [
      nautilus
      bitwarden-desktop
      obsidian
      jetbrains.pycharm-community
      pkgs-2311.jetbrains.clion
      pkgs-2311.jetbrains.goland
      simple-scan

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

      bottles
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
    ]);
}
