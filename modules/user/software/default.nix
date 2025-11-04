{
  inputs,
  pkgs,
  unstable,
  ...
}: let
  zenWithWayland = pkgs.symlinkJoin {
    name = "zen-browser-wayland";
    paths = [inputs.zen-browser.packages."${pkgs.system}".default];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/zen \
        --set MOZ_ENABLE_WAYLAND 1
    '';
  };
in {
  imports = [
    ./editors
    ./programming
    ./spotify.nix
  ];

  home.packages = [
    zenWithWayland
    pkgs.ungoogled-chromium

    unstable.materialgram
    pkgs.vesktop

    unstable.yandex-music

    pkgs.libreoffice
    pkgs.bitwarden-desktop
    unstable.transmission_4
    pkgs.obs-studio
    pkgs.obsidian

    unstable.hydralauncher
    unstable.protonplus
    unstable.bottles
    unstable.lutris
  ];
}
