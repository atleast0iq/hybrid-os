{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    inputs.ags.packages.${pkgs.system}.astal
    inputs.ags.packages.${pkgs.system}.apps
    inputs.ags.packages.${pkgs.system}.auth
    inputs.ags.packages.${pkgs.system}.battery
    inputs.ags.packages.${pkgs.system}.bluetooth
    inputs.ags.packages.${pkgs.system}.hyprland
    inputs.ags.packages.${pkgs.system}.mpris
    inputs.ags.packages.${pkgs.system}.network
    inputs.ags.packages.${pkgs.system}.notifd
    inputs.ags.packages.${pkgs.system}.powerprofiles
    inputs.ags.packages.${pkgs.system}.tray
    inputs.ags.packages.${pkgs.system}.wireplumber
  ];

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
      glib
      gjs
      sassc

      inputs.ags.packages.${pkgs.system}.apps
      inputs.ags.packages.${pkgs.system}.auth
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.bluetooth
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.notifd
      inputs.ags.packages.${pkgs.system}.powerprofiles
      inputs.ags.packages.${pkgs.system}.tray
      inputs.ags.packages.${pkgs.system}.wireplumber
    ];
  };
}
