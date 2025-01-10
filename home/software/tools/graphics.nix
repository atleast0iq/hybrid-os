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
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
    ]);
}
