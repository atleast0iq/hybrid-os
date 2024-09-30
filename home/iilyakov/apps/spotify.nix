{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify = let
    spicetifyPkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;
    theme = spicetifyPkgs.themes.dribbblish;
    colorScheme = "catppuccin-mocha";
  };
}
