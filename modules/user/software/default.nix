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

    unstable.telegram-desktop
    pkgs.vesktop

    pkgs.libreoffice
    pkgs.bitwarden-desktop
    pkgs.transmission_4-gtk
    pkgs.obs-studio
    pkgs.obsidian
  ];
}
