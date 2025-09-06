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
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;
    theme = lib.mkForce spicePkgs.themes.sleek;
    colorScheme = lib.mkForce "custom";
    customColorScheme = {
      text = "${config.lib.stylix.colors.base05}";
      subtext = "${config.lib.stylix.colors.base04}";
      nav-active-text = "${config.lib.stylix.colors.base0D}";
      main = "${config.lib.stylix.colors.base01}";
      sidebar = "${config.lib.stylix.colors.base01}";
      player = "${config.lib.stylix.colors.base01}";
      card = "${config.lib.stylix.colors.base01}";
      shadow = "000000";
      main-secondary = "${config.lib.stylix.colors.base01}";
      button = "${config.lib.stylix.colors.base04}";
      button-secondary = "${config.lib.stylix.colors.base0C}";
      button-active = "${config.lib.stylix.colors.base0D}";
      button-disabled = "${config.lib.stylix.colors.base01}";
      nav-active = "${config.lib.stylix.colors.base01}";
      play-button = "${config.lib.stylix.colors.base0D}";
      tab-active = "${config.lib.stylix.colors.base01}";
      notification = "${config.lib.stylix.colors.base01}";
      notification-error = "${config.lib.stylix.colors.base01}";
      playback-bar = "${config.lib.stylix.colors.base0D}";
      misc = "f4dbd6";
    };
  };
}
