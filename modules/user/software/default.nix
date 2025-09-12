{
  inputs,
  pkgs,
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

  home.packages = with pkgs; [
    zenWithWayland

    telegram-desktop
    vesktop

    bitwarden-desktop
    transmission_4-gtk
    obs-studio
    obsidian
  ];
}
